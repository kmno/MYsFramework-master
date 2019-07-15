//
//  MYsExpireDateTextField.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 1/16/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsBaseExpireDateTextField: BaseTextField,UIPickerViewDelegate,UIPickerViewDataSource {

    
    var datePicker = UIPickerView()
    var selectedYear = 0
    var selectedMonth = 0
    
    var arrYears = [Int]()
    var arrMonth = [Int]()
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
        
        let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.persian)
        //Now asking the calendar what month are we in today’s date:
        let currentYearInt = (calendar?.component(NSCalendar.Unit.year, from: Date()))!
        let currentMonthInt = (calendar?.component(NSCalendar.Unit.month, from: Date()))!
        
        for index in currentYearInt ... currentYearInt + 9{
            arrYears.append(index)
        }
        
        for index in 1...12{
            arrMonth.append(index)
        }
        arrYears.reverse()
        datePicker.selectRow(4, inComponent: 0, animated: true)
        datePicker.selectRow(currentMonthInt - 1, inComponent: 1, animated: true)
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var count = 0
        switch component {
        case 0:
            count = arrYears.count
        case 1:
            count = arrMonth.count
        default:
            break
        }
        return count
    }
    
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let lblTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 86, height: 40))
        lblTitle.numberOfLines = 0
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont.fontWithSize(size: 19)
        switch component {
        case 0:
            let tYear = arrYears[row].ToString()
            lblTitle.text = tYear
        case 1:
            lblTitle.text = arrMonth[row].ToString()
        default:
            break
        }
        return lblTitle
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            selectedYear = arrYears[row]
        case 1:
            selectedMonth = arrMonth[row]
        default:
            break
        }
        self.changecompletionHandler()
        getTextSelected()
    }
    
    open override func doneButton(sender: UIButton) {
        self.getTextSelected()
        self.changecompletionHandler()
        super.doneButton(sender: sender)
        
    }
    
    open func getTextSelected(){
        selectedYear = arrYears[datePicker.selectedRow(inComponent: 0)]
        selectedMonth = arrMonth[datePicker.selectedRow(inComponent: 1)]
        let tYear = selectedYear.ToString().subString(offSet: 2, length: 2)!
        let tMonth = selectedMonth < 10 ? "0\(selectedMonth)" : selectedMonth.ToString()
        self.text = "\(tYear)/\(tMonth)"
    }
    
    public func setYear(formYear : Int,to : Int){
        arrYears.removeAll()
        for index in formYear ... to {
            arrYears.append(index)
        }
    }
}
