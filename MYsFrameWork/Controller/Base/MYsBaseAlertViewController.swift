//
//  MYsBaseAlertViewController.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 2/11/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

public protocol MYsAlertProtocol{
    
    func showMessage(target:UIViewController, alert : MYsAlertModel)
    
    func showMessage(target:UIViewController, alert : MYsAlertModel, doneTitle:String)
    
    func showMessage(target:UIViewController, alert : MYsAlertModel, doneTitle:String, cancelTitle:String)
    
    func changeAlertViewHeight(message:String)
}

open class MYsBaseAlertViewController: MYsGeneralViewController {
    
    
    
    open var defaultHeight = CGFloat(300)
    open var vwBlureView: UIView!
    open var ishiddenWhenTap = true
    open var isViewdidLoad = false
    open var isLoadedPage = false
    open var enumAction = enumStatus.none
    open var mysCaptions = MYsCaptions()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.initial()


        if self.vwBlureView != nil{
            self.vwBlureView.frame = UIScreen.main.bounds
            self.view.insertSubview(self.vwBlureView, at: 0)
        }
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    
    // MARK: - Custom Method
    
    open override func initial() {
        
        vwBlureView = UIView(frame: self.view.frame)
    }
    
    override open func moveViews(topHeight: CGFloat,complition:@escaping ()->()){
        
    }
    
    @objc open func doneButton(){
        self.doneCompletionHandler()
        dissMissView()
    }
    
    @objc open func cancelButton(){
        self.cancelCompletionHandler()
        dissMissView()
    }
    
    open override func dismissKeyboard() {
        super.dismissKeyboard()
//        if ishiddenWhenTap{
//            dissMissView()
//        }
    }
    
    open override func dissMissView(){
        self.dismiss(animated: true, completion: disAppearCompletionHandler)
    }
    
    @objc open func nextPage() {
        
    }
    
    @objc open func goBack() {
        
    }
    
    
    
    
}
