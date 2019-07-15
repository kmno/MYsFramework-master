//
//  MYsDropDownTextField.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 12/24/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsBaseDropDownTextField: BaseTextField,UIPickerViewDataSource,UIPickerViewDelegate {
    
    public var picker = UIPickerView()
    var imageHeight = CGFloat(18)
    
    var arrYears = [Int]()
    var arrMonth = [Int]()
    var arrDays = [Int]()
    open var imageView = UIImageView()
    
    public var models = [MYsSimpleDataListObject](){
        didSet{
            self.picker.reloadComponent(0)
        }
    }
    public var selectedIndex : Int = -1 {
        didSet{
            if self.models.count < 1 {
                self.selectedIndex = -1
            }
        }
    }
    
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
        self.placeholder = "--------"
        self.keyboardType = .numberPad
        if self.models.count < 1{
            self.inputView = picker
        }
        self.font = UIFont.fontWithSize(size: 16)
        self.cornerRadius = self.height / 2
        
//        let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.persian)
        //Now asking the calendar what month are we in today’s date:
//        let currentYearInt = (calendar?.component(NSCalendar.Unit.year, from: Date()))!
        
        imageView = UIImageView(frame: CGRect(x: 16, y: self.height / 2 - (imageHeight / 2), width: imageHeight, height: imageHeight))
        imageView.cornerRadius = imageView.height / 2
        imageView.image = UIImage(named:"skh_arrow_down")
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
        if models[row].title.isEmpty{
            models[row].title = models[row].name
        }
        lblTitle.numberOfLines = 0
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont.fontWithSize(size: 19)
        lblTitle.text = models[row].title
        return lblTitle
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if models.count > 0 {
            self.text = models[row].title
            selectedIndex = row
            changedCompletionHandler()
        }
    }
    
    override open func doneButton(sender: UIButton) {
        if self.inputView != nil{
            selectedIndex = picker.selectedRow(inComponent: 0)
            setTitle()
        }
        super.doneButton(sender: sender)
    }
    
    override open func cancelButton() {
        self.text = ""
        self.selectedIndex = -1
        super.cancelButton()
    }
    
    open func setTitle() {
        if self.selectedIndex > -1 {
            if self.models.count > 0 {
                selectedIndex = picker.selectedRow(inComponent: 0)
                let model = self.models[picker.selectedRow(inComponent: 0)]
                self.text = model.title.isEmpty ? model.name : model.title
                return
            }
        }
        self.text = ""
    } 
    
    
    public func getData(fieldId:String,fieldTitle:String,arrays:[[String:Any]])->[MYsSimpleDataListObject]{
        var items = [MYsSimpleDataListObject]()
        for index in arrays{
            let model = MYsSimpleDataListObject()
            model.id = index[fieldId] as! String
            if let tTitle = index[fieldTitle] as? String{
                model.title = tTitle
            }
            if let tName = index[fieldTitle] as? String{
                model.name = tName
            }
            items.append(model)
        }
        
        return items
    }
}



