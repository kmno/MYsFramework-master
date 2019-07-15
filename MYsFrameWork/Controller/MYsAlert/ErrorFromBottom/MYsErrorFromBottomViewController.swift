//
//  ErrorAlertViewController.swift
//  Sekke
//
//  Created by mahdi yousefpour on 1/15/18.
//  Copyright © 2018 BehPardakhtMellat. All rights reserved.
//

import UIKit

open class MYsErrorFromBottomViewController: MYsBaseAlertViewController {

    
    @IBOutlet open weak var vwContainer: UIView!
    @IBOutlet open weak var imgLogo: UIImageView!
    @IBOutlet open weak var lblTitle: MYsDefaultLable!
    @IBOutlet open weak var lblMessage: MYsDefaultLable!
    @IBOutlet open  weak var btnOk: MYsBaseDefaultButton!
    @IBOutlet open weak var btnCancel: MYsBaseDefaultButton!
    @IBOutlet weak var lcImageHeight: NSLayoutConstraint!
    @IBOutlet weak var lcImageLogoTop: NSLayoutConstraint!
    @IBOutlet weak var lcCancelButton: NSLayoutConstraint!
    @IBOutlet weak var lcVwAlertContainerHeight: NSLayoutConstraint!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        initial()
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Initial
    
    override open func initial() {
        super.initial()
        if ishiddenWhenTap {
            self.hideKeyboardWhenTappedAround()
        }
        
        defaultHeight = (self.view.height / 2.5)
        self.view.backgroundColor = .clear
        self.moveViews(topHeight: 450)
        MYsUtilities.delay(0.3) {
            self.vwBlureView.addBlurEffect()
        }
        self.vwContainer.cornerRadius = 10
        self.vwBlureView.backgroundColor = UIColor.clear.withAlphaComponent(0.1)
        
        self.btnOk.addTarget(self, action: #selector(doneButton), for: .touchUpInside)
        self.btnCancel.addTarget(self, action: #selector(cancelButton), for: .touchUpInside)
        
        self.btnOk.setTitleColor(UIColor.normal, for: .normal)
        self.btnOk.setTitleColor(UIColor.lightGray, for: .highlighted)
        
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
        
        if btnCancel.titleLabel?.text == nil{
            lcCancelButton.constant = 0
        }
        
        self.btnCancel.titleLabel?.font = UIFont(size: 14)
        self.btnOk.titleLabel?.font = UIFont(size: 14)
        
        didLoadCompletionHandler()
    }
    
    
    
    // MARK: - Alert Delegate
    
    public func showMessage(target: UIViewController, alert: MYsAlertModel) {
        target.presentAsPopUp(viewcontroller: self, animated: true) {
            self.initial()
            self.moveViews(topHeight: 0)
            self.changeAlertViewHeight(message: alert.message)
            self.btnOk.setTitle("MYS_CAPTION_OK".localized, for: .normal)
            self.setAlertValue(alert: alert)
            self.willShowMessageCompletionHandler()
        }
    }
    
    public func showMessage(target: UIViewController, alert: MYsAlertModel, doneTitle: String) {
        target.presentAsPopUp(viewcontroller: self, animated: true) {
            self.initial()
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
            self.moveViews(topHeight: 0)
            self.setAlertValue(alert: alert)
            self.changeAlertViewHeight(message: alert.message)
            self.btnOk.setTitle(doneTitle.localized, for: .normal)
            self.btnCancel.setTitle(cancelTitle.localized, for: .normal)
            self.willShowMessageCompletionHandler()
        }
    }
    
    public func changeAlertViewHeight(message:String){
        lblMessage.text = message.localized
        lblMessage.numberOfLines = 0
        let descheight = lblMessage.getHeight()
        let height = defaultHeight + descheight + 80
        lcVwAlertContainerHeight.constant = height
        
    }
    
    
    
    // MARK: - Custom Method

    func setAlertValue(alert: MYsAlertModel){
        self.lblTitle.text = alert.title.localized
        self.lblMessage.text = alert.message.localized
        self.lblTitle.textColor = .title
        self.lblMessage.textColor = .details
        
        if !alert.logoName.isEmpty{
            self.imgLogo.image = UIImage(named:alert.logoName)
        }
        
        if imgLogo.image == nil{
            self.lcImageHeight.constant = 0
            self.lcImageLogoTop.constant = 8
        }
        
        if !alert.doneTitle.isEmpty{
            self.btnOk.setTitle(alert.doneTitle.localized, for: .normal)
        }
        if !alert.cancelTitle.isEmpty{
            self.btnCancel.setTitle(alert.cancelTitle.localized, for: .normal)
        }
        
    }
    
//    func customInfo(image:UIImage?, title:String, message:String, buttonTitle:String, cancelButtonTitle:String){
//        if image == nil{
//            self.imgLogo.setImage(image: image)
//            self.lcImageHeight.constant = 0
//        }else{
//            self.imgLogo.setImage(image: image)
//        }
//        self.labelTitle.text = title
//        self.labelTitle.textColor = UIColor("#0A60AB")
//        self.labelDescription.text = message
//        self.labelDescription.textColor = UIColor("#95989A")
//        self.labelDescription.font = UIFont.fontWithSize(size: 13)
//        self.btnOk.setTitle(buttonTitle, for: .normal)
//        self.btnOk.setTitleColor(UIColor("#0A60AB"), for: .normal)
//        self.btnOk.addTarget(self, action: #selector(doneButton), for: .touchUpInside)
//        
//        if cancelButtonTitle.count < 1{
//            self.btnCancel.isHidden = true
//            lcCancelButton.constant = 0
//        }else{
//            self.btnCancel.isHidden = false
//        }
//        self.btnCancel.setTitle(cancelButtonTitle, for: .normal)
//        self.btnCancel.setTitleColor(UIColor("#0A60AB"), for: .normal)
//        self.btnCancel.addTarget(self, action: #selector(cancelButton), for: .touchUpInside)
//        moveViews(topHeight: 0)
//    }
    
//    func internetConnectionFail(target: UIViewController){
//        self.labelDescription.textColor = UIColor("#95989A")
//        self.btnOk.setTitle("متوجه شدم", for: .normal)
//        self.btnOk.setTitleColor(UIColor("#FF3C3F"), for: .normal)
//        self.btnOk.addTarget(self, action: #selector(doneButton), for: .touchUpInside)
//        moveViews(topHeight: 0)
//
//        alertObject.checkInternetConnection.logoName = "skh_sadface_nointernetconection"
//        self.showMessage(target: target, alert: alertObject.checkInternetConnection, doneTitle: "MYS_ERROR_UNDERSTAND".localized, doneCompletionHandler: doneButton)
//    }
//
//    func forceUpdate(image:UIImage?, title:String, message:String, buttonTitle:String){
//        self.ishiddenWhenTap = false
//        self.labelTitle.text = title
//        self.labelTitle.textColor = UIColor("#0A60AB")
//        self.labelDescription.text = message
//        self.labelDescription.textColor = UIColor("#95989A")
//        self.btnOk.setTitle(buttonTitle, for: .normal)
//        self.btnOk.setTitleColor(UIColor("#FF3C3F"), for: .normal)
//        self.btnOk.addTarget(self, action: #selector(doneButton), for: .touchUpInside)
//        moveViews(topHeight: 0)
//    }
//
//    func appCrashing(){
//        self.imgLogo.setImage(image: UIImage(named:"icskh_redface"))
//        self.labelTitle.text = "متاسفانه مشکلی پیش آمده"
//        self.labelTitle.textColor = UIColor("#0A60AB")
//        self.labelDescription.text = "الان متوجه شدیم که حین استفاده از نرم افزار سکه مشکلی برای شما پیش آمده ما در سکه متوجه این مشکل شدیم و سعی می کنیم در آپدیت بعدی آن را رفع کنیم"
//        self.labelDescription.textColor = UIColor("#95989A")
//        self.btnOk.setTitle("متوجه شدم", for: .normal)
//        self.btnOk.setTitleColor(UIColor("#FF3C3F"), for: .normal)
//        self.btnOk.addTarget(self, action: #selector(dissMissView), for: .touchUpInside)
//        moveViews(topHeight: 0)
//    }
 
    
    
       
    
    @objc override open func dissMissView(){
        moveViews(topHeight: 450)
        self.dismiss(animated: true, completion: disAppearCompletionHandler)
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
    
    
    override open func moveViews(topHeight: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.vwContainer.transform = CGAffineTransform(translationX: 0, y: topHeight)
        }
    }
    
    override open func moveViews(topHeight: CGFloat,complition:@escaping ()->()) {
        UIView.animate(withDuration: 0.3) {
            self.vwContainer.transform = CGAffineTransform(translationX: 0, y: topHeight)
        }
    }
    
    override open func dismissKeyboard() {
        super.dismissKeyboard()
        dissMissView()
    }

}
