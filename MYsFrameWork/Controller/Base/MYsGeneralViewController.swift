//
//  MYsGeneralViewController.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 2/11/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsGeneralViewController: UIViewController, UIActionSheetDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate, UIPopoverPresentationControllerDelegate {

    open var doneCompletionHandler : ()->Void = {}
    open var cancelCompletionHandler : ()->Void = {}
    open var didLoadCompletionHandler : ()->Void = {}
    open var disAppearCompletionHandler : ()->Void = {}
    open var willShowMessageCompletionHandler : ()->Void = {}
    open var didSelectCompletionHandler : (Any)->Void = {_ in}
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Custom Method
    
    open func initial() {
    }
    
    open func hideKeyboardWhenTappedAroundView() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    open func hideKeyboardWhenTappedAround(customView:UIView){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        customView.addGestureRecognizer(tap)
    }
    
    open func addGestureTo(customView:UIView){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tappedView))
        customView.addGestureRecognizer(tap)
    }
    
    open func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        view.subviews.forEach { (element) in
            if(type(of: element) == UIScrollView.self || type(of: element) == UIView.self){
                let newTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
                element.addGestureRecognizer(newTap)
            }
        }
        tap.delegate = self
    }

    open func moveViews(textfield: UITextField){
    }
    open func moveViews(topHeight: CGFloat){
    }
    
    open func moveViews(topHeight: CGFloat,complition:@escaping ()->()) {
    }
    
    @objc open func tappedView() {
        view.endEditing(true)
    }
    
    @objc open func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc open func dissMissView(){
        
    }
    
    @objc open func setStatusBarColor(color:UIColor){
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.backgroundColor = color
    }
    
    @objc open func setStatusBarStyle(style:UIStatusBarStyle){
         UIApplication.shared.statusBarStyle = style
    }
    
    open func setTransparentNavigationBar(){
//        UINavigationBar.appearance().clipsToBounds = true
//        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
//        statusBar.backgroundColor = UIColor.rgbColor(r:98, g: 160, b: 201)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    open func setTransparentNavigationBar(color:UIColor){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = color
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    open func setNavigationBarColor(color:UIColor,textColor:UIColor,itemColor: UIColor){
        
        setStatusBarColor(color: color)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = color
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = itemColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:textColor,NSAttributedString.Key.font:UIFont.defaultFont()]
    }
    
    

}
