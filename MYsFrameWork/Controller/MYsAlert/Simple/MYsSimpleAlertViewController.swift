//
//  MYsSimpleAlertViewController.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 1/23/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsSimpleAlertViewController: MYsBaseAlertViewController,MYsAlertProtocol {
    
    @IBOutlet var vwContainer: UIView!
    @IBOutlet var imgLogo: UIImageView!
    @IBOutlet var vwImage: UIView!
    @IBOutlet var lblTitle: MYsDefaultLable!
    @IBOutlet var lblMessage: MYsDetailsLable!
    @IBOutlet var btnOk: MYsBaseDoneButton!
    @IBOutlet var btnCancel: MYsBaseDefaultButton!
    @IBOutlet var lcVWContainerHeight: NSLayoutConstraint!
    
    var target = UIViewController()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        initial()
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Alert Delegate
    
//    public func showMessage(target: UIViewController, alert: MYsAlertModel) {
//        target.presentAsPopUp(viewcontroller: self, animated: true) {
//            self.changeAlertViewHeight(message: alert.message.localized)
//            self.willShowMessageCompletionHandler()
//        }
//    }
//
//    public func showMessage(target: UIViewController, alert: MYsAlertModel, doneTitle: String) {
//        target.presentAsPopUp(viewcontroller: self, animated: true) {
//            self.changeAlertViewHeight(message: alert.message.localized)
//            self.btnOk.setTitle(doneTitle, for: .normal)
//            self.willShowMessageCompletionHandler()
//        }
//    }
//
//    public func showMessage(target: UIViewController, alert: MYsAlertModel, doneTitle: String, cancelTitle: String) {
//        target.presentAsPopUp(viewcontroller: self, animated: true) {
//            self.changeAlertViewHeight(message: alert.message.localized)
//            self.btnOk.setTitle(doneTitle, for: .normal)
//            self.btnCancel.setTitle(cancelTitle, for: .normal)
//            self.willShowMessageCompletionHandler()
//        }
//    }

    public func changeAlertViewHeight(message:String){
        lblMessage.text = message
        let descheight = lblMessage.getHeight()
        let height = self.vwContainer.height + descheight
        lcVWContainerHeight.constant = height
    }

    public func showMessage(target: UIViewController, alert: MYsAlertModel) {
        target.presentAsPopUp(viewcontroller: self, animated: true) {
            self.initial()
            self.target = target
            self.moveViews(topHeight: 0)
            self.setAlertValue(alert: alert)
            self.changeAlertViewHeight(message: alert.message)
            self.btnOk.setTitle("MYS_CAPTION_OK".localized, for: .normal)
            self.willShowMessageCompletionHandler()
        }
    }
    
    public func showMessage(target: UIViewController, alert: MYsAlertModel, doneTitle: String) {
        target.presentAsPopUp(viewcontroller: self, animated: true) {
            self.initial()
            self.target = target
            self.moveViews(topHeight: 0)
            self.setAlertValue(alert: alert)
            self.changeAlertViewHeight(message: alert.message)
            self.btnOk.setTitle(doneTitle.localized, for: .normal)
            self.willShowMessageCompletionHandler()
        }
    }
    
    public func showMessage(target: UIViewController, alert: MYsAlertModel, doneTitle: String, cancelTitle: String) {
        target.presentAsPopUp(viewcontroller: self, animated: true) {
            self.initial()
            self.target = target
            self.moveViews(topHeight: 0)
            self.setAlertValue(alert: alert)
            self.changeAlertViewHeight(message: alert.message)
            self.btnOk.setTitle(doneTitle.localized, for: .normal)
            self.btnCancel.setTitle(cancelTitle.localized, for: .normal)
            self.willShowMessageCompletionHandler()
        }
    }
    
    
    // MARK: - Custom Method

    override open func initial() {
        if ishiddenWhenTap{
            hideKeyboardWhenTappedAround()
        }
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
//        viewController = MYsSimpleAlertViewController(nibName: "MYsSimpleAlertViewController", bundle: Bundle(identifier: "com.myousefpour.MYsFrameWork"))
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        self.btnOk.addTarget(self, action: #selector(doneButton), for: .touchUpInside)
        self.btnCancel.addTarget(self, action: #selector(cancelButton), for: .touchUpInside)
        
        if enumAction == .caution{
            self.btnOk.setTitleColor(UIColor.normal, for: .normal)
            self.btnOk.setTitleColor(UIColor.highLight, for: .highlighted)
        }else if enumAction == .warning{
            self.btnOk.setTitleColor(UIColor.warning, for: .normal)
            self.btnOk.setTitleColor(UIColor.highLight, for: .highlighted)
        }else if enumAction == .success{
            self.btnOk.setTitleColor(UIColor.success, for: .normal)
            self.btnOk.setTitleColor(UIColor.highLight, for: .highlighted)
        }
        
        self.btnCancel.setTitleColor(UIColor.cancel, for: .normal)
        self.btnCancel.setTitleColor(UIColor.highLight, for: .highlighted)
        self.didLoadCompletionHandler()
    }

    
    
    
    @objc override open func doneButton(){
        self.doneCompletionHandler()
        if ishiddenWhenTap{
            dissMissView()
        }
    }
    
    @objc override open func cancelButton(){
        self.cancelCompletionHandler()
        if ishiddenWhenTap{
            dissMissView()
        }
    }
    
    open override func dissMissView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.view.alpha = 0
            self.vwContainer.alpha = 0
        }) { (flag) in
            if flag{
                MYsUtilities.delay(0.25) {
                    self.dismiss(animated: true, completion: self.disAppearCompletionHandler)
                }
            }
        }
        
    }

    
    func setAlertValue(alert: MYsAlertModel){
        self.lblTitle.text = alert.title.localized
        self.lblMessage.text = alert.message.localized
        
        if !alert.logoName.isEmpty{
            self.imgLogo.image = UIImage(named:alert.logoName)
        }
        
        if !alert.doneTitle.isEmpty{
            self.btnOk.setTitle(alert.doneTitle.localized, for: .normal)
        }
        if !alert.cancelTitle.isEmpty{
            self.btnCancel.setTitle(alert.cancelTitle.localized, for: .normal)
        }
        
    }
}
