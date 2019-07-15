//
//  MYsDatePickerTextField.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 2/28/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsBaseDatePickerTextField: BaseTextField {
    
    public var datePicker = UIDatePicker()
    public var imageHeight = CGFloat(18)
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
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.calendar = Calendar(identifier: .persian)
        datePicker.locale = Locale(identifier: "fa_IR")
        datePicker.addTarget(self, action: #selector(self.datePickerValueChanged), for: UIControl.Event.valueChanged)
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
//
//        let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.persian)
//        //Now asking the calendar what month are we in today’s date:
//        let currentYearInt = (calendar?.component(NSCalendar.Unit.year, from: Date()))!
//
    
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.locale = Locale(identifier: "fa_IR")
        dateFormatter.dateFormat = "yyyy/MM/dd"
        self.text = sender.date.GregorianToPersianDate()
        self.changedCompletionHandler()
    }
    
    
    override func doneButton(sender: UIButton) {
        setTitle()
        super.doneButton(sender: sender)
        
    }
    
    override func cancelButton() { 
        super.cancelButton()
    }
    
    public func setTitle(){
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.locale = Locale(identifier: "fa_IR")
        dateFormatter.dateFormat = "yyyy/MM/dd"
        self.text = datePicker.date.GregorianToPersianDate()
    }
    
    public func setYear(from:Date?,to:Date?){
        self.datePicker.minimumDate = from == nil ? Date() : from
        self.datePicker.maximumDate = to == nil ? Date() : to
    }
    
    public func setDate(from:Date?,to:Date?){
        self.datePicker.minimumDate = from == nil ? Date() : from
        self.datePicker.maximumDate = to == nil ? Date() : to
    }
    
    public func currentDate(){
        self.datePicker.date = Date()
    }
    
}

