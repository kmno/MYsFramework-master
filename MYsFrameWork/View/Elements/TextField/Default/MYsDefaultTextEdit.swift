//
//  MYsDefaultTextEdit.swift
//  Abotorab
//
//  Created by Mahdi Yousefpour on 9/16/16.
//  Copyright © 2016 Mahdi Yousefpour. All rights reserved.
//

import UIKit


open class MYsBaseDefaultTextEdit: BaseTextField {
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initial()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initial()
    }
    
    open  override func initial(){
        super.initial()
        var frame = self.frame
        frame.size.height = 45
        self.frame = frame
        
        
//        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeHolder])
        self.textColor = UIColor("#2D7ABF")
        self.font = UIFont.fontWithSize(size: 14)
        self.backgroundColor = UIColor("#DDDDDD").withAlphaComponent(0.9)
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.barStyle = UIBarStyle.default
        toolBar.isUserInteractionEnabled = true
        
        let doneButton = UIBarButtonItem(title: "تایید", style: .plain, target: self, action: #selector(self.doneButton(sender:)))
        doneButton.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.fontWithSize(size: 12)], for: UIControl.State.normal)
        doneButton.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.fontWithSize(size: 12)], for: UIControl.State.selected)
        
        let cancelButton = UIBarButtonItem(title: "انصراف", style: .plain, target: self, action: #selector(self.cancelButton))
        cancelButton.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.fontWithSize(size: 12)], for: UIControl.State.normal)
        cancelButton.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.fontWithSize(size: 12)], for: UIControl.State.selected)
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
//        self.inputAccessoryView = toolBar
    }
    
    override func doneButton(sender:UIButton) {
        _ = self.endEditing(true)
    }
    
    override func cancelButton() {
        self.text = ""
        _ = self.endEditing(true)
    }
    
}

