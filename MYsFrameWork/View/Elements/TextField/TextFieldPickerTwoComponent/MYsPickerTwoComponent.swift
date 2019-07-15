//
//  MYsPickerTwoComponent.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 5/21/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit


open class MYsBasePickerTwoComponent: BaseTextField,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    var datePicker = UIPickerView()
    var leftModels = [[String]]()
    var rightModels = [String]()
    public var rightValue = String()
    public var leftValue = String()
    
    public var changecompletionHandler: ()->Void = {}
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //initial()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initial()
    }
    
    open override func initial() {
        super.initial()
        datePicker = UIPickerView()
        datePicker.delegate = self
        datePicker.backgroundColor = .white
        self.borderWidth = 0
        self.placeholder = "--/--"
        self.keyboardType = .numberPad
        self.inputView = datePicker
        self.font = UIFont.fontWithSize(size: 16)
        self.cornerRadius = self.height / 2
        
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var count = 0
        switch component {
        case 0:
            count = rightModels.count
        case 1:
            count = leftModels[datePicker.selectedRow(inComponent: 0)].count
        default:
            break
        }
        return count
    }
    
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let lblTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 86, height: 40))
        lblTitle.numberOfLines = 0
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont.fontWithSize(size: 14)
        switch component {
        case 0:
            let str = rightModels[row]
            lblTitle.text = str
        case 1:
            let arrTemp = leftModels[datePicker.selectedRow(inComponent: 0)]
            lblTitle.text = arrTemp[row].ToString()
        default:
            break
        }
        return lblTitle
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            rightValue = rightModels[row]
            datePicker.reloadComponent(1)
        case 1:
            let arrTemp = leftModels[datePicker.selectedRow(inComponent: 0)]
            leftValue = arrTemp[row]
        default:
            break
        }
        self.changecompletionHandler()
        getTextSelected()
    }
    
    open override func doneButton(sender: UIButton) {
        self.changecompletionHandler()
        super.doneButton(sender: sender)
        
    }
    
    open func getTextSelected(){
        rightValue = self.rightModels[datePicker.selectedRow(inComponent: 0)]
        let arrTemp = leftModels[datePicker.selectedRow(inComponent: 0)]
        leftValue = arrTemp[datePicker.selectedRow(inComponent: 1)]
        self.text = leftValue
    }
    
    public func setarrayes(leftArray : [[String]],rightArrays : [String]){
        leftModels = leftArray
        rightModels = rightArrays
    }
}
