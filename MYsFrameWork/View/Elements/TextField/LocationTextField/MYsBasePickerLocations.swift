//
//  MYsBasePickerLocations.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 5/3/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsBasePickerLocations: BaseTextField,UIPickerViewDelegate {

    public var picker = UIPickerView()
    var imageHeight = CGFloat(18)
    public var arrCountries = [MYsSimpleDataListObject]()
    public var arrProvinces = [MYsSimpleDataListObject]()
    public var arrCities = [MYsSimpleDataListObject]()
    public var pickerFontSize = CGFloat(14)
    public var pickerTextColor = UIColor.black
    
    open var models = [MYsSimpleDataListObject](){
        didSet{
            self.picker.reloadComponent(0)
        }
    }
    
    public var selectedIndex = -1
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //initial()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initial()
    }
    
    override open func initial() {
        super.initial()
        picker = UIPickerView()
        picker.delegate = self
        picker.backgroundColor = .white
        self.borderWidth = 0
        self.placeholder = ""
        self.keyboardType = .numberPad
        if self.models.count < 1{
            self.inputView = picker
        }
        self.font = UIFont.fontWithSize(size: 16)
        self.roundCornerRadius()
        
        let imageView = UIImageView(frame: CGRect(x: 16, y: self.height / 2 - (imageHeight / 2), width: imageHeight, height: imageHeight))
        imageView.cornerRadius = imageView.height / 2
//        imageView.image = UIImage(named:"")
        self.addSubview(imageView)
        
        
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return models.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let lblTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.picker.width, height: 40))
        lblTitle.font = UIFont.fontWithSize(size: pickerFontSize)
        lblTitle.textColor = pickerTextColor
        switch component {
        case 0:
            if arrCountries[row].title.isEmpty{
                arrCountries[row].title = arrCountries[row].name
            }
            lblTitle.numberOfLines = 0
            lblTitle.textAlignment = .center
            lblTitle.text = arrCountries[row].title
        case 1 :
            if arrProvinces[row].title.isEmpty{
                arrProvinces[row].title = arrProvinces[row].name
            }
            lblTitle.numberOfLines = 0
            lblTitle.textAlignment = .center
            lblTitle.text = arrProvinces[row].title
        case 2:
            if arrCities[row].title.isEmpty{
                arrCities[row].title = arrCities[row].name
            }
            lblTitle.numberOfLines = 0
            lblTitle.textAlignment = .center
            lblTitle.text = arrCities[row].title
        default:
            break
        }
        return lblTitle
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            if arrCountries.count > 0 {
                self.text = arrCountries[row].title
            }
        case 1:
            if arrProvinces.count > 0 {
                self.text = arrProvinces[row].title
            }
        case 2:
            if arrCities.count > 0 {
                self.text = arrCities[row].title
                selectedIndex = row
            }
        default:
            break
        }
    }
    
    override open func doneButton(sender: UIButton) {
        selectedIndex = picker.selectedRow(inComponent: 2)
        setTitle()
        super.doneButton(sender: sender)
    }
    
    override open func cancelButton() {
        self.text = ""
        self.selectedIndex = -1
        super.cancelButton()
    }
    
    open func setTitle() {
        if self.selectedIndex > -1 {
            if self.arrCities.count > 0 {
                selectedIndex = picker.selectedRow(inComponent: 2)
                let model = self.arrCities[picker.selectedRow(inComponent: 2)]
                self.text = model.title.isEmpty ? model.name : model.title
                return
            }
        }
        self.text = ""
    }

    open func setModels(countries: [MYsSimpleDataListObject],provinces:[MYsSimpleDataListObject],cities:[MYsSimpleDataListObject]) {
        self.arrCountries = countries
        self.arrProvinces = provinces
        self.arrCities = cities
        self.picker.reloadAllComponents()
    }
    
    public func getData(fieldId:String,fieldTitle:String,arrays:[[String:Any]])->[MYsSimpleDataListObject]{
        var items = [MYsSimpleDataListObject]()
        for index in arrays{
            let model = MYsSimpleDataListObject()
            model.id = index[fieldId] as! String
            model.title = index[fieldTitle] as! String
            items.append(model)
        }
        
        return items
    }

}
