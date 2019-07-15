//
//  BaseTextField.swift
//  Sekke
//
//  Created by mahdi yousefpour on 12/24/17.
//  Copyright © 2017 BehPardakhtMellat. All rights reserved.
//

import UIKit

open class BaseTextField: UITextField,UITextFieldDelegate {
    public var lblhelp = MYsDefaultLable()
    public var indexPath = IndexPath()
    public var target = UIViewController()
    public var compareController = UITextField()
    
    public var isNumber = Bool()
    public var animDuration = TimeInterval(0.3)
    public var emptyMessage = String()
    public var defaultMessage = String()
    public var numericMessage = String()
    public var compareMessage = String()
    public var maxLengthMessage = String()
    public var minLengthMessage = String()
    
    public var type = enumTextFieldTypes.none{didSet{self.setDefaultLimitationCharacters()}}
    public var value = ""
    public var oldValue = ""
    public var topBorder = UIView()
    public var leftBorder = UIView()
    public var rightBorder = UIView()
    public var bottomBorder = UIView()
    public var transferView = UIView()
    public var transferViews = [UIView]()
    
    public var moveY = CGFloat()
    public var moveX = CGFloat()
    
    public var doneCompletionHandler: ()->Void = {}
    public var cancelCompletionHandler: ()->Void = {}
    public var changedCompletionHandler: ()->Void = {}
    public var showMessageCompletionHandler: (MYsAlertModel)->Void = {_ in }
    public var completionHandlerDoneWithTextFeild: (UITextField)->Void = {_ in }
    public var willTransferCompletionHandler: ()->Void = {} // When transfer view animation was will
    public var didTransgerCompletionHandler: ()->Void = {} // When transfer view animation was did
    public var beginTransgerCompletionHandler: ()->Void = {} // When textfield Editing was begin
    public var willTransgerCompletionHandler: ()->Void = {} // When textfield Editing was will
    public var endTransgerCompletionHandler: ()->Void = {} // When textfield Editing was end
    public var endEditingCompletionHandler: ()->Void = {} // When textfield Editing was end
    
    
    @IBInspectable public var minLength = Int()
    @IBInspectable public var maxLength = Int()
    @IBInspectable public var errorTextColor = UIColor.lightGray
    @IBInspectable public var activeTextColor = UIColor.lightGray
    @IBInspectable public var defaultTextColor = UIColor.lightGray{didSet{self.textColor = defaultTextColor }}
    @IBInspectable public var successTextColor = UIColor.lightGray
    @IBInspectable public var errorBackColor  = UIColor.lightGray
    @IBInspectable public var defaultBackColor = UIColor.lightGray{didSet{self.backgroundColor = defaultBackColor }}
    @IBInspectable public var successBackColor = UIColor.lightGray
    @IBInspectable public var activeBackColor = UIColor.lightGray
    @IBInspectable public var defaultBorderColor = UIColor.lightGray
    @IBInspectable public var placeHolderColor: UIColor? {
        get {return self.placeHolderColor}
        set {self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])}
    }
    
    @IBInspectable public var placeholderFontSize = CGFloat(14)
    @IBInspectable public var textFieldFontSize = CGFloat(14)
    @IBInspectable override open var placeholder: String?{
        didSet{
            self.attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeHolder,NSAttributedString.Key.font : UIFont.fontWithSize(size: placeholderFontSize)])
        }
    }
    
    public var isValid : Bool {
        
        get{
            self.setMessages(empty: MYsCaptions().FILLREQUIREDFIELDS, min: MYsCaptions().MINCHARACTERSISINVALID, max: MYsCaptions().MAXCHARACTERSISINVALID, numeric: MYsCaptions().ISNOTNUMBERFORMAT, compare: "")
            var isvalid = false
            defaultMessage = ""
            let alert = MYsAlertModel()
//            alert.title = MYsCaptions().OK
            
            alert.doneTitle = MYsCaptions().OK
            alert.cancelTitle = ""
            self.borderColor = UIColor.textFieldFailedBorder
            self.borderWidth = 1
            self.backgroundColor = UIColor.textFieldFailedBackground
            
            if self.text!.isEmpty{
                defaultMessage = emptyMessage
            }else if self.text!.count < minLength{
                defaultMessage = minLengthMessage
            }else if isNumber && self.text! != "0" && self.text!.enNumber.ToInt64() < 1{
                defaultMessage = numericMessage
            }else if self.text!.count > maxLength{
                defaultMessage = minLengthMessage
            }else if !self.compareController.text!.isEmpty && self.text != compareController.text{
                defaultMessage = compareMessage
            }else{
                self.backgroundColor = UIColor.textFieldBackground
                self.borderColor = UIColor.border
                isvalid = true
            }
            
            if !isvalid && !defaultMessage.isEmpty{
                alert.message = defaultMessage
                self.showMessageCompletionHandler(alert)
            }
            return isvalid
        }
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        delegate = self
        initial()
    }
    
    override public  init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        initial()
    }
    
    open  func initial(){
        
        var frame = self.frame
        frame.size.height = 45
        self.frame = frame
        delegate = self
        
        self.textColor = UIColor.black
        self.font = UIFont.fontWithSize(size: 14)
        self.clearButtonMode = UITextField.ViewMode.whileEditing
        self.defaultBackColor = UIColor("#F0F0F0").withAlphaComponent(0.9)
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.barStyle = UIBarStyle.default
        toolBar.isUserInteractionEnabled = true
        
        let doneButton = UIBarButtonItem(title: MYsCaptions().OK, style: .plain, target: self, action: #selector(self.doneButton(sender:)))
        doneButton.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.fontWithSize(size: 16)], for: UIControl.State.selected)
        doneButton.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.fontWithSize(size: 16)], for: UIControl.State.normal)
        
        let cancelButton = UIBarButtonItem(title: MYsCaptions().CANCEL, style: .plain, target: self, action: #selector(self.cancelButton))
        cancelButton.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.fontWithSize(size: 16)], for: UIControl.State.selected)
        cancelButton.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.fontWithSize(size: 16)], for: UIControl.State.normal)
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
//        self.inputAccessoryView = toolBar
        
        addTarget(self, action: #selector(self.textFieldWillEditing(_:)), for: .editingChanged)
        addTarget(self, action: #selector(self.textFieldDidBeginEditing(_:)), for: .editingDidEnd)
        addTarget(self, action: #selector(self.textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        self.setDefaultLimitationCharacters()
    }
    
    @objc func doneButton(sender:UIButton) {
        _ = self.endEditing(true)
        self.doneCompletionHandler()
        self.completionHandlerDoneWithTextFeild(self)
    }
    
    @objc func cancelButton() {
        self.text = self.oldValue
        _ = self.endEditing(true)
        self.cancelCompletionHandler()
        self.cancelCompletionHandler()
    }
    
    open override func endEditing(_ force: Bool) -> Bool {
        super.endEditing(force)
        self.endEditingCompletionHandler()
        _ = checkLenght(self)
        return true
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
    
    open func textFieldDidBeginEditing(_ textField: UITextField) {
        self.backgroundColor = UIColor.textFieldBackground
        if maxLength > 0 && !textField.isEmpty && textField.text!.count > maxLength{
            textField.text = textField.text?.subString(offSet: 0, length: maxLength)
        }
    }
    
    @objc open func textFieldWillEditing(_ textField: UITextField) {
        self.backgroundColor = UIColor.textFieldBackground
        if maxLength > 0 && !textField.isEmpty && textField.text!.count > maxLength{
            textField.text = textField.text?.subString(offSet: 0, length: maxLength)
        }
    }
    
    open func textFieldDidEndEditing(_ textField: UITextField) {
        _ = checkLenght(textField)
        if maxLength > 0 && !textField.isEmpty && textField.text!.count > maxLength{
            textField.text = textField.text?.subString(offSet: 0, length: maxLength)
        }
    }
    
    
    open func setTopBorder(borderColor: UIColor) {
        self.borderStyle = UITextField.BorderStyle.none
        let height = 1.0
        
        topBorder.frame = CGRect(x: 0, y: 0, width: Double(self.frame.width), height: height)
        
        topBorder.backgroundColor = borderColor
        self.addSubview(topBorder)
    }
    
    open func setRightBorder(borderColor: UIColor) {
        self.borderStyle = UITextField.BorderStyle.none
        let width = 1.0

        rightBorder.frame = CGRect(x: Double(self.frame.width) - width, y: 0, width: width , height: Double(self.frame.height))
        
        rightBorder.backgroundColor = borderColor
        self.addSubview(rightBorder)
        
    }
    
    open func setBottomBorder(borderColor: UIColor) {
        self.borderStyle = UITextField.BorderStyle.none
        let height = 1.0
        
        bottomBorder.frame = CGRect(x: 0, y: Double(self.frame.height) - height, width: Double(self.frame.width), height: height)
        
        bottomBorder.backgroundColor = borderColor
        self.addSubview(bottomBorder)
    }
    
    open func setLeftBorder(borderColor: UIColor) {
        self.borderStyle = UITextField.BorderStyle.none
        let width = 1.0

        leftBorder.frame = CGRect(x: 0, y: 0, width: width , height: Double(self.frame.height))
        
        leftBorder.backgroundColor = borderColor
        self.addSubview(leftBorder)
    }
    
    
    open func checkLenght(_ textField: UITextField)-> Bool{
            if maxLength > 0 && !textField.isEmpty && textField.text!.count > maxLength{
                textField.text = textField.text?.subString(offSet: 0, length: maxLength)
            }
            
            if minLength > 0 && !textField.isEmpty && textField.text!.count < minLength{
                return false
            }
        return true
    }
    
    open func setMessages(empty:String,min:String,max:String,numeric:String,compare:String){
        self.emptyMessage = empty
        self.minLengthMessage = min
        self.maxLengthMessage = max
        self.numericMessage = numeric
        self.compareMessage = compare
    
    }
    
    open func beginEditing() {
        
    }
    
    open func endEditing() {
        
    }
    
    open func setFillColor() {
    }
    
    open func setFailedColor() {
        
    }
    
    open func setDefaultColor() {
        
    }
    
    open func setText(input:String) {
        self.text = input
        self.borderColor = UIColor.border
    }
    
    open func doWithDelay(delay:Double, complition:@escaping ()->()) {
        MYsUtilities.delay(delay, closure: complition)
    }
    
    open func moveView(x:CGFloat, y:CGFloat) {
        UIView.animate(withDuration: animDuration, animations: {
            
            self.willTransferCompletionHandler()
            print(self.transferView.transform)
            self.transferView.transform = CGAffineTransform(translationX: x, y: y)
            for index in self.transferViews{
                index.transform = CGAffineTransform(translationX: x, y: y)
            }
        }) { (flag) in
            if flag {
                self.didTransgerCompletionHandler()
            }
        }
        
    }
    
   open func addCaptionLabel(){
        MYsUtilities.delay(0.123456789) {
            self.lblhelp = MYsDefaultLable(frame: CGRect(x: 0, y: Int(self.height), width: Int(self.width), height: 24))
            self.lblhelp.textColor = UIColor.textFieldFailedBorder
            self.lblhelp.font = UIFont(size: 12)
            self.lblhelp.alpha = 0
            self.addSubview(self.lblhelp)
        }
    }
    
    open func setErrorCaption(title:String){
        MYsUtilities.delay(0.4) {
            self.lblhelp.text = title
            self.lblhelp.font = UIFont(size: 12)
        }
    }
    
    
    open func showErrorCaption(){
        UIView.animate(withDuration: 0.3) {
            self.setFailedColor()
            self.lblhelp.alpha = 1
            self.lblhelp.font = UIFont(size: 12)
        }
    }
    
    open func setDefaultLimitationCharacters(){
        switch type {
        case .bill:
            self.maxLength = 26
            self.minLength = 13
        case .card:
            self.maxLength = 19
            self.minLength = 16
        case .longamount:
            self.maxLength = 20
            self.minLength = 1
        case .mobile:
            self.maxLength = 11
            self.minLength = 11
        case .otp:
            self.maxLength = 6
            self.minLength = 4
        case .password:
            self.maxLength = 50
            self.minLength = 8
        case .postalCode:
            self.maxLength = 10
            self.minLength = 10
        case .smallamount:
            self.maxLength = 10
            self.minLength = 1
        case .tel:
            self.maxLength = 11
            self.minLength = 7
        case .username:
            self.maxLength = 50
            self.minLength = 3
        default:
            self.maxLength = 50
            self.minLength = 1
        }
        
    }
}
