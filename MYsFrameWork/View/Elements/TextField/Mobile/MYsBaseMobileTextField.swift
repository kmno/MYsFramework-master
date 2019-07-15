//
//  MYsBaseMobileTextField.swift
//  MYsFrameWork
//
//  Created by Mahdi Yousefpour on 11/26/18.
//  Copyright © 2018 MYs. All rights reserved.
//

import Foundation

open class MYsBaseMobileTextField: MYsBaseDefaultTextEdit {
    
    open override func awakeFromNib() {
        initial()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initial()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initial()
    }
     
    open override func initial() {
        super.initial()
        
        self.minLength = 1
        self.maxLength = 11
        self.borderWidth = 0
        self.cornerRadius = 4
        self.textAlignment = .center
        self.keyboardType = .numberPad
        self.font = UIFont.fontWithSize(size: 15)
        self.placeHolderColor = UIColor.placeHolder
        self.backgroundColor = .clear
        self.borderColor = UIColor.border
        self.textColor = UIColor.textField
        super.errorBackColor = UIColor.textFieldFailedBackground
        
        self.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)
        self.addTarget(self, action: #selector(textFieldWillEditing), for: .editingChanged)
        self.addTarget(self, action: #selector(textFieldDidBeginEditing), for: .editingDidBegin)
        self.addCaptionLabel()
        self.setBottomBorder(borderColor: .white)
    }
    
    open override func textFieldDidBeginEditing(_ textField: UITextField) {
        self.beginTransgerCompletionHandler()
//        self.moveView(x: self.moveX, y: self.moveY)
        self.bottomBorder.backgroundColor = UIColor.textFieldSelectedBorder
        self.borderColor = .clear
        self.backgroundColor = .clear
        self.text = textField.text?.subString(offSet: 0, length: maxLength)
    }
    
    @objc open override func textFieldWillEditing(_ textField: UITextField) {
        self.borderColor = UIColor.textFieldSelectedBorder
        self.text = textField.text?.subString(offSet: 0, length: maxLength)?.enNumber
        self.bottomBorder.backgroundColor = UIColor.textFieldSelectedBorder
        self.willTransferCompletionHandler()
    }
    
    open override func textFieldDidEndEditing(_ textField: UITextField) {
//        self.moveView(x: 0, y: 0)
        self.text = textField.text?.subString(offSet: 0, length: maxLength)
        self.endTransgerCompletionHandler()
        self.backgroundColor = .clear
        self.borderWidth = 0
        
        if self.text!.isEmpty{
            self.backgroundColor = UIColor.textFieldBackground
            self.borderColor = UIColor.border
        }else{
            self.backgroundColor = UIColor.textFieldBackground
            self.borderColor = UIColor.textFieldSelectedBorder
            self.bottomBorder.backgroundColor = UIColor.textFieldSelectedBorder
        }
    }
}
