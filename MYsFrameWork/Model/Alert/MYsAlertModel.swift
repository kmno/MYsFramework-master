//
//  MYsAlertModel.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 1/23/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsAlertModel: NSObject {
    
    public var id = String()
    public var title = String()
    public var message = String()
    public var logoName = String()
    public var doneTitle = String()
    public var cancelTitle = String()
    public var doneImage = String()
    public var cancelImage = String()
    public var otherTitle = String()
    public var Description = String()
    public var isDismiss = Bool(true)
    public var otherButtons = [UIAlertAction]()
    public var target = UIViewController()
    public var doneCompletion : (()->())? = {}
    public var cancelCompletion : (()->())? = {}
    public var otherCompletion : (()->())? = {}

    public override init() {
        super.init()
    }
    public init(title:String,message:String,logo:String,doneButton:String,cancelButton:String,doneAction:(()->())?,canceAction:(()->())?) {
        self.title = title
        self.message = message
        self.logoName = logo
        self.doneTitle = doneButton
        self.cancelTitle = cancelButton
        self.doneCompletion = doneAction
        self.cancelCompletion = canceAction
    }
    
    open func showMessage(_ target:UIViewController){
        let titleAttributed = NSMutableAttributedString(string: self.title.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 18)!])
        let messageAttributed = NSMutableAttributedString(string: self.message.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
        
        let alert = UIAlertController(title: self.title.localized, message: self.message.localized, preferredStyle: .alert)
        alert.setValue(titleAttributed, forKey : "attributedTitle")
        alert.setValue(messageAttributed, forKey : "attributedMessage")
        
        if !self.doneTitle.isEmpty{
            let doneAction = UIAlertAction(title: self.doneTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: self.doneTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
                    // Fallback on earlier versions
                }
                if self.doneCompletion != nil{
                    self.doneCompletion!()
                }
            }
            alert.addAction(doneAction)
        }
        if !self.cancelTitle.isEmpty{
            alert.addAction(UIAlertAction(title: self.cancelTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: self.cancelTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
                    // Fallback on earlier versions
                }
                if self.cancelCompletion != nil{
                    self.cancelCompletion!()
                }
            })
        }
        
        if !self.otherTitle.isEmpty{
            alert.addAction(UIAlertAction(title: self.otherTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: self.otherTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
                    // Fallback on earlier versions
                }
                if self.otherCompletion != nil{
                    self.otherCompletion!()
                }
            })
        }
        
        if otherButtons.count > 0 {
            for index in otherButtons{
                alert.addAction(index)
            }
        }
        target.present(alert, animated: true)
    }
    
    open func showActionSheets(_ target:UIViewController){
        let titleAttributed = NSMutableAttributedString(string: self.title.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 18)!])
        let messageAttributed = NSMutableAttributedString(string: self.message.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
        
        let alert = UIAlertController(title: self.title.localized, message: self.message.localized, preferredStyle: .actionSheet)
        alert.setValue(titleAttributed, forKey : "attributedTitle")
        alert.setValue(messageAttributed, forKey : "attributedMessage")
        
        if !self.doneTitle.isEmpty{
            let doneAction = UIAlertAction(title: self.doneTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: self.doneTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
//                    let titleFont:[String : AnyObject] = [ NSFontAttributeName : UIFont(name: "AmericanTypewriter", size: 18)! ]
//                    let messageFont:[String : AnyObject] = [ NSFontAttributeName : UIFont(name: "HelveticaNeue-Thin", size: 14)! ]
//                    let attributedTitle = NSMutableAttributedString(string: "Multiple buttons", attributes: titleFont)
//                    let attributedMessage = NSMutableAttributedString(string: "Select an Action", attributes: messageFont)
//                    alert.setValue(attributedTitle, forKey: "attributedTitle")
//                    alert.setValue(attributedMessage, forKey: "attributedMessage")
                }
                if self.doneCompletion != nil{
                    self.doneCompletion!()
                }
            }
             
            alert.addAction(doneAction)
        }
        if !self.cancelTitle.isEmpty{
            alert.addAction(UIAlertAction(title: self.cancelTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: self.cancelTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
                    // Fallback on earlier versions
                }
                if self.cancelCompletion != nil{
                    self.cancelCompletion!()
                }
            })
        }
        
        if !self.otherTitle.isEmpty{
            alert.addAction(UIAlertAction(title: self.otherTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: self.otherTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
                    // Fallback on earlier versions
                }
                if self.otherCompletion != nil{
                    self.otherCompletion!()
                }
            })
        }
        
        if otherButtons.count > 0 {
            for index in otherButtons{
                alert.addAction(index)
            }
        }
        target.present(alert, animated: true)
    }

    open func showMessage(){
        let titleAttributed = NSMutableAttributedString(string: self.title.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 18)!])
        let messageAttributed = NSMutableAttributedString(string: self.message.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
        
        let alert = UIAlertController(title: self.title.localized, message: self.message.localized, preferredStyle: .alert)
        alert.setValue(titleAttributed, forKey : "attributedTitle")
        alert.setValue(messageAttributed, forKey : "attributedMessage")
        
        if !self.doneTitle.isEmpty{
            let doneAction = UIAlertAction(title: self.doneTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: self.doneTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
                    // Fallback on earlier versions
                }
                if self.doneCompletion != nil{
                    self.doneCompletion!()
                }
            }
            alert.addAction(doneAction)
        }
        if !self.cancelTitle.isEmpty{
            alert.addAction(UIAlertAction(title: self.cancelTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: self.cancelTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
                    // Fallback on earlier versions
                }
                if self.cancelCompletion != nil{
                    self.cancelCompletion!()
                }
            })
        }
        
        if !self.otherTitle.isEmpty{
            alert.addAction(UIAlertAction(title: self.otherTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: self.otherTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
                    // Fallback on earlier versions
                }
                if self.otherCompletion != nil{
                    self.otherCompletion!()
                }
            })
        }
        
        if otherButtons.count > 0 {
            for index in otherButtons{
                alert.addAction(index)
            }
        }
        
        self.target.present(alert, animated: true)
    }
    
    open func showActionSheets(){
        let titleAttributed = NSMutableAttributedString(string: self.title.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 18)!])
        let messageAttributed = NSMutableAttributedString(string: self.message.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
        
        let alert = UIAlertController(title: self.title.localized, message: self.message.localized, preferredStyle: .actionSheet)
        alert.setValue(titleAttributed, forKey : "attributedTitle")
        alert.setValue(messageAttributed, forKey : "attributedMessage")
        
        if !self.doneTitle.isEmpty{
            let doneAction = UIAlertAction(title: self.doneTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: self.doneTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
                    //                    let titleFont:[String : AnyObject] = [ NSFontAttributeName : UIFont(name: "AmericanTypewriter", size: 18)! ]
                    //                    let messageFont:[String : AnyObject] = [ NSFontAttributeName : UIFont(name: "HelveticaNeue-Thin", size: 14)! ]
                    //                    let attributedTitle = NSMutableAttributedString(string: "Multiple buttons", attributes: titleFont)
                    //                    let attributedMessage = NSMutableAttributedString(string: "Select an Action", attributes: messageFont)
                    //                    alert.setValue(attributedTitle, forKey: "attributedTitle")
                    //                    alert.setValue(attributedMessage, forKey: "attributedMessage")
                }
                if self.doneCompletion != nil{
                    self.doneCompletion!()
                }
            }
            alert.addAction(doneAction)
        }
        if !self.cancelTitle.isEmpty{
            alert.addAction(UIAlertAction(title: self.cancelTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: self.cancelTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
                    // Fallback on earlier versions
                }
                if self.cancelCompletion != nil{
                    self.cancelCompletion!()
                }
            })
        }
        
        if !self.otherTitle.isEmpty{
            alert.addAction(UIAlertAction(title: self.otherTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: self.otherTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
                    // Fallback on earlier versions
                }
                if self.otherCompletion != nil{
                    self.otherCompletion!()
                }
            })
        }
        
        if otherButtons.count > 0 {
            for index in otherButtons{
                alert.addAction(index)
            }
        }
        self.target.present(alert, animated: true)
    }

}
