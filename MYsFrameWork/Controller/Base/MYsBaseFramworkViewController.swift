//
//  MYsBaseViewController.swift
//  Abotorab
//
//  Created by Mahdi Yousefpour on 7/21/16.
//  Copyright © 2016 Mahdi Yousefpour. All rights reserved.
//

import UIKit
import MessageUI


open class MYsBaseFramworkViewController: MYsGeneralViewController,UITableViewDataSource,UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITextViewDelegate,MFMailComposeViewControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    open var isRTL = false
    public var models = [Any]()
    open var isLoadedPage = false
    public var fadeView = UIView()
    public var loadingView = UIView()
    public var rowWidth = CGFloat(0)
    public var rowHeight = CGFloat(0)
    public var circleLableWidth = 167
    public var alertObject = MYsAlertObject()
    public var activityIndicatorView = UIActivityIndicatorView()
    public var emailViewController : MFMailComposeViewController!
    public var fadeViewColor = UIColor.black.withAlphaComponent(0.4)
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.rowWidth = self.view.width
        self.rowHeight = 180
        self.view.backgroundColor = UIColor.rgbColor(r: 255, g: 255, b: 255)
        self.addApplicationStatusNotification()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    // MARK: - Parent Methods
    
    open func funcInitLoading(){
        self.loadingView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        self.fadeView = UIView(frame: loadingView.frame)
        self.activityIndicatorView.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 15, y: UIScreen.main.bounds.height / 2 - 15, width: 30, height: 30)
        self.fadeView.backgroundColor = self.fadeViewColor
        self.loadingView.alpha = 0
        let tap = UIGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self
        self.loadingView.addGestureRecognizer(tap)
        self.fadeView.addGestureRecognizer(tap)
        self.fadeView.isUserInteractionEnabled = true
        self.loadingView.isUserInteractionEnabled = true
        if !self.view.subviews.contains(self.loadingView){
            
            MYsUtilities.delay(0.3, closure: {
                let blureview = UIView(frame: self.fadeView.frame)
                blureview.addBlurEffect()
                self.loadingView.insertSubview(blureview, at: 0)
                self.loadingView.addSubview(self.fadeView)
                self.view.addSubview(self.loadingView)
                self.loadingView.addSubview(self.activityIndicatorView)
            })
        }
    }
    
    open func showMYsLoading(){
        dismissKeyboard()
        funcInitLoading()
        self.activityIndicatorView.startAnimating()
        UIView.animate(withDuration: 0.3) {
            self.loadingView.alpha = 1
        }
    }
    
    open func hideMYsLoading(){
        dismissKeyboard()
        self.activityIndicatorView.stopAnimating()
        UIView.animate(withDuration: 0.3) {
            self.loadingView.alpha = 0
        }
        
    }
    
    @objc open func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc open func logOut(){
    }
    
    @objc open func nextPage(){
    }
    
    open func addApplicationStatusNotification(){
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(appDidMovedToForegroundStatus), name: UIApplication.didEnterBackgroundNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(appWillMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc open func appMovedToBackground() {
        
    }
    
    @objc open func appWillMovedToForeground() {
        
    }
    
    @objc open func appDidMovedToForegroundStatus() {
        
    }
    
    @objc open func handleTap(_ sender: UITapGestureRecognizer) {
        hideMYsLoading()
    }
    
    @objc open func closeBarButtonItem(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "MYS_CAPTION_CLOSE".localized, style: .plain, target: self, action: #selector(goBack))
    }
    
    @objc open func backBarButtonItem(){
        
    }
    
    @objc open func loadData(){
        
    }
    
    open func getCurrentMobileNumber()-> String{
        if let curentNumber = MYsUtilities.getUserDefault(key: "currentMobile") as? String{
            if !curentNumber.withoutSpace().isEmpty && curentNumber.withoutSpace().count > 0{
                return curentNumber.withoutSpace()
            }
            return ""
        }
        return ""
    }
    
    open func isValidText(target:UIViewController, input:String, minChar:Int, maxChar:Int, isNumber:Bool, errorEmpty:String, errorMinChar:String, errorMaxChar:String)->Bool{
        if input.isEmpty || input.count < minChar {
            let alert = alertObject.fillRequiredField
            alert.doneTitle = "MYS_CAPTION_OK".localized
            self.showMessage( model: alert, type: .warning)
            //            alertObject.simpleAlert.showMessage(target: target, alert: alertObject.fillRequiredField)
            return false
        }
        
        if input.enNumber.isEmpty && isNumber {
            let alert = alertObject.isNumeric
            alert.doneTitle = "MYS_CAPTION_OK".localized
            self.showMessage(model: alert, type: .warning)
            //            alertObject.simpleAlert.showMessage(target: target, alert: alertObject.isNumeric)
            return false
        }
        
        if input.count < minChar {
            let alert = alertObject.minCharacter
            alert.doneTitle = "MYS_CAPTION_OK".localized
            self.showMessage(model: alert, type: .warning)
            //            alertObject.simpleAlert.showMessage(target: target, alert: alertObject.minCharacter)
            return false
        }
        if input.isEmpty || input.count > maxChar {
            let alert = alertObject.maxCharacter
            alert.doneTitle = "MYS_CAPTION_OK".localized
            alert.target = target
            self.showMessage(model: alert, type: .warning)
            //            alertObject.simpleAlert.showMessage(target: target, alert: alertObject.maxCharacter)
            return false
        }
        return true
    }
    
    
    
    // MARK: - TableView Delegate
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view  = UIView(frame: CGRect(x: 0, y: 0, width: self.view.width, height: 40))
        view.backgroundColor = .clear
        return view
    }
    
    
    
    // MARK: - CollectionView Delegate
    
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    open func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    open func addPageControl(pageCount:Int,current:Int,currentColor:UIColor, currentBorderColor:UIColor?, otherColor:UIColor, otherBorderColor:UIColor) {
        
        let pageControl = UIPageControl(frame: CGRect(x:(self.view.frame.width/2)-50,y: self.view.frame.height-32,width: 100,height: 20))
        pageControl.numberOfPages = pageCount
        pageControl.currentPage = current 
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = otherColor
        pageControl.currentPageIndicatorTintColor = currentColor
        for (index, dot) in pageControl.subviews.enumerated() {
            if index == pageControl.currentPage {
                dot.backgroundColor = currentColor
                dot.layer.cornerRadius = dot.frame.size.height / 2;
            } else {
                dot.backgroundColor = otherColor
                dot.layer.cornerRadius = dot.frame.size.height / 2
                dot.layer.borderColor = otherBorderColor.cgColor // ?  : otherBorderColor?.cgColor
                dot.layer.borderWidth = 1
            }
        }
        
        self.view.addSubview(pageControl)
    }
    
    open func addPageControl(target:UIView,pageCount:Int,current:Int,currentColor:UIColor, currentBorderColor:UIColor?, otherColor:UIColor, otherBorderColor:UIColor) {
        
        let pageControl = UIPageControl(frame: CGRect(x:Int(Int(UIScreen.main.bounds.width / 3) - Int((UIDevice.IsIPhone5 ? 20 : 15) * pageCount)),y: 8,width: 20 * pageCount,height: 20))
        pageControl.numberOfPages = pageCount
        pageControl.currentPage = current
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = otherColor
        pageControl.currentPageIndicatorTintColor = currentColor
        for (index, dot) in pageControl.subviews.enumerated() {
            if index == pageControl.currentPage {
                dot.backgroundColor = currentColor
                dot.layer.cornerRadius = dot.frame.size.height / 2;
            } else {
                dot.backgroundColor = otherColor
                dot.layer.cornerRadius = dot.frame.size.height / 2
                dot.layer.borderColor = otherBorderColor.cgColor // ?  : otherBorderColor?.cgColor
                dot.layer.borderWidth = 1
            }
        }
        
        target.addSubview(pageControl)
    }
    
    open func showAlertMessage(model:MYsAlertModel,doneCompletion:(()->Void)?,cancelCompletion:(()->Void)?){
        let titleAttributed = NSMutableAttributedString(string: model.title.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 18)!])
        let messageAttributed = NSMutableAttributedString(string: model.message.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
        let doneAttribute = NSMutableAttributedString(string: model.doneTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
        let cancelAttribute = NSMutableAttributedString(string: model.cancelTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
        
        let alert = UIAlertController(title: model.title.localized, message: model.message.localized, preferredStyle: .alert)
        alert.setValue(titleAttributed, forKey : "attributedTitle")
        alert.setValue(messageAttributed, forKey : "attributedMessage")
        
        if !model.doneTitle.isEmpty{
            let doneAction = UIAlertAction(title: model.doneTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = doneAttribute
                } else {
                    // Fallback on earlier versions
                }
                if doneCompletion != nil{
                    doneCompletion!()
                }
            }
            alert.addAction(doneAction)
        }
        
        if !model.cancelTitle.isEmpty{
            alert.addAction(UIAlertAction(title: model.cancelTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = cancelAttribute
                } else {
                    // Fallback on earlier versions
                }
                if cancelCompletion != nil{
                    cancelCompletion!()
                }
            })
        }
        self.present(alert, animated: true)
    }
    
//    open func showMessage(_ target:UIViewController, model:MYsAlertModel,type:enumMessageType){
//
//    }
    
    open func showMessage(model:MYsAlertModel,type:enumMessageType){
        
    }
    
    
    // MARK: - Email Delegate
    
    open func sendMail(subject:String,body:String) {
        emailViewController = MFMailComposeViewController()
        emailViewController.mailComposeDelegate = self
        emailViewController.setSubject(subject)
        emailViewController.setMessageBody(body, isHTML: true)
        self.present(emailViewController, animated: true) {
            
        }
    }
    
    open func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        emailViewController.dismiss(animated: true, completion: nil)
    }
    
    
    
    // MARK: - ImagePicker Delegate
    
    open func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    
    open func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
    }
    
    open  func showImagePickerAcctionSheet(imagePicker:UIImagePickerController, title:String, galleryTitle:String, cameraTitle:String, cancelTitle:String) {
        // 1
        let optionMenu = UIAlertController(title: nil, message: title, preferredStyle: .actionSheet)
        
        // 2
        let deleteAction = UIAlertAction(title: galleryTitle.localized, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            //            imagePicker =  UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.navigationBar.isTranslucent = false
            imagePicker.navigationBar.barTintColor = UIColor.navigationBar
            
            self.present(imagePicker, animated: true, completion: nil)
        })
        
        let saveAction = UIAlertAction(title: cameraTitle.localized, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            //            imagePicker =  UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            
            //imagePicker.sourceType = .PhotoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        })
        
        //
        let cancelAction = UIAlertAction(title: cancelTitle.localized, style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            imagePicker.dismiss(animated: true, completion: nil)
        })
        
        
        // 4
        
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    open func showImagePickerAcctionSheet(imagePicker:UIImagePickerController, title:String, galleryTitle:String, cameraTitle:String, cancelTitle:String,navColor:UIColor) {
        // 1
        let optionMenu = UIAlertController(title: nil, message: title, preferredStyle: .actionSheet)
        
        // 2
        let deleteAction = UIAlertAction(title: galleryTitle.localized, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            //            imagePicker =  UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.navigationBar.isTranslucent = false
            imagePicker.navigationBar.barTintColor = navColor
            
            self.present(imagePicker, animated: true, completion: nil)
        })
        
        let saveAction = UIAlertAction(title: cameraTitle.localized, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            //            imagePicker =  UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            
            //imagePicker.sourceType = .PhotoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        })
        
        //
        let cancelAction = UIAlertAction(title: cancelTitle.localized, style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            imagePicker.dismiss(animated: true, completion: nil)
        })
        
        
        // 4
        
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.present(optionMenu, animated: true, completion: nil)
    }
}

