//
//  MYsDateTextField.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 12/24/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsBaseDateTextField: BaseTextField,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var datePicker = UIPickerView()
    var selectedYear = 0
    var selectedMonth = 0
    var selectedDay = 0
    
    var imageHeight = CGFloat(18)
    var arrYears = [Int]()
    var arrMonth = [Int]()
    var arrDays = [Int]()
    public var imageView = UIImageView()
    
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
        self.placeholder = "----/--/--"
        self.keyboardType = .numberPad
        self.inputView = datePicker
        self.font = UIFont.fontWithSize(size: 16)
        self.cornerRadius = self.height / 2
    
    
        imageView = UIImageView(frame: CGRect(x: 16, y: self.height / 2 - (imageHeight / 2), width: imageHeight, height: imageHeight))
        imageView.image = UIImage(named:"skh_date_range")
        self.addSubview(imageView)
        
        let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.persian)
        //Now asking the calendar what month are we in today’s date:
        let currentYearInt = (calendar?.component(NSCalendar.Unit.year, from: Date()))!
        
        for index in currentYearInt - 70 ... currentYearInt - 16{
            arrYears.append(index)
        }
        
        for index in 1...12{
            arrMonth.append(index)
        }
        
        for index in 1...31{
            arrDays.append(index)
        }
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var count = 0
        switch component {
        case 0:
            count = arrYears.count
        case 1:
            count = arrMonth.count
        default:
            count = arrDays.count
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
            lblTitle.text = arrYears[row].ToString()
        case 1:
            lblTitle.text = arrMonth[row].ToString()
        default:
            lblTitle.text = arrDays[row].ToString()
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
            selectedDay = arrDays[row]
        }
        setTitle()
    }

    override func doneButton(sender: UIButton) {
        super.doneButton(sender: sender)
        setTitle()
    }
    
    public func setTitle(){
        selectedYear = arrYears[datePicker.selectedRow(inComponent: 0)]
        selectedMonth = arrMonth[datePicker.selectedRow(inComponent: 1)]
        selectedDay = arrDays[datePicker.selectedRow(inComponent: 2)]
        let strdMonth = selectedMonth < 10 ? "0\(selectedMonth)": selectedMonth.ToString()
        let strdDay = selectedDay < 10 ? "0\(selectedDay)": selectedDay.ToString()
        self.text = "\(selectedYear)/\(strdMonth)/\(strdDay)"
    }
    
    public func setYear(formYear : Int,to : Int){
        arrYears.removeAll()
        for index in formYear ... to {
            arrYears.append(index)
        }
    }
}
