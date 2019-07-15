//
//  MYsDefaultTextView.swift
//  Abotorab
//
//  Created by Mahdi Yousefpour on 7/22/16.
//  Copyright © 2016 Mahdi Yousefpour. All rights reserved.
//

import UIKit

open class MYsDefaultTextView: UITextView,UITextViewDelegate {
    @IBInspectable public var minLength = 0
    @IBInspectable public var maxLength = 0
    @IBInspectable public var errorTextColor = UIColor.lightGray
    @IBInspectable public var defaultTextColor = UIColor.lightGray{didSet{self.textColor = defaultTextColor }}
    @IBInspectable public var successTextColor = UIColor.lightGray
    @IBInspectable public var errorBackColor  = UIColor.lightGray
    @IBInspectable public var defaultBackColor = UIColor.lightGray{didSet{self.backgroundColor = defaultBackColor }}
    @IBInspectable public var successBackColor = UIColor.lightGray
    
    public var completionHandlerDone: ()->Void = {}
    public var completionHandlerCancel: ()->Void = {}
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        delegate = self
        initial()
    } 
    
    open  func initial(){
        delegate = self
        var frame = self.frame
        frame.size.height = 45
        self.frame = frame
        
        self.font = UIFont.fontWithSize(size: 14)
        self.textColor = UIColor.black
        self.defaultBackColor = UIColor("#F0F0F0").withAlphaComponent(0.9)
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.barStyle = UIBarStyle.default
        toolBar.isUserInteractionEnabled = true
        
        let doneButton = UIBarButtonItem(title: MYsCaptions().OK, style: .plain, target: self, action: #selector(self.doneButton(sender:)))
        doneButton.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.fontWithSize(size: 12)], for: UIControl.State.normal)
        doneButton.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.fontWithSize(size: 12)], for: UIControl.State.selected)
        
        let cancelButton = UIBarButtonItem(title: MYsCaptions().CANCEL, style: .plain, target: self, action: #selector(self.cancelButton))
        cancelButton.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.fontWithSize(size: 12)], for: UIControl.State.normal)
        cancelButton.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.fontWithSize(size: 12)], for: UIControl.State.selected)
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
//        self.inputAccessoryView = toolBar
        
        
//        addTarget(self, action: #selector(self.textFieldDidBeginEditing(_:)), for: .editingChanged)
    }
    
    public func setGradient(colors:[UIColor], startPoint:CGPoint?, endPoint:CGPoint?){
        //* set gradient on view
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.locations = nil
        gradient.frame = self.bounds
        gradient.startPoint = startPoint == nil ? CGPoint(x: 0, y: 0.5) : startPoint!
        gradient.startPoint = endPoint == nil ? CGPoint(x: 0, y: 0.5) : endPoint!
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.cornerRadius = self.layer.cornerRadius
        gradient.colors = colors.map{ $0.cgColor }
        self.layer.insertSublayer(gradient, at: 0)
        //*
    }
    
    @objc func doneButton(sender:UIButton) {
        _ = self.endEditing(true)
        self.completionHandlerDone()
    }
    
    @objc func cancelButton() {
        self.text = ""
        _ = self.endEditing(true)
        self.completionHandlerCancel()
    }
    
}
