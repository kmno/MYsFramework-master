//
//  MYsAlertViewController.swift
//  FCFramework
//
//  Created by mahdi yousefpour on 10/3/17.
//  Copyright © 2017 Mahdi Yousefpour. All rights reserved.
//

import UIKit

open class MYsAlertViewController: UIViewController {
    @IBOutlet weak var lcAlertBoxHeight: NSLayoutConstraint!
    @IBOutlet weak var lcAlertBoxWidth: NSLayoutConstraint!
    @IBOutlet weak var lcBtnCancelHeight: NSLayoutConstraint!
    @IBOutlet weak var lcBtnOkBottom: NSLayoutConstraint!
    @IBOutlet weak var lcLblDescription: NSLayoutConstraint!
    @IBOutlet weak var vwAlertBox: UIView!
    @IBOutlet weak var vwLogo: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnOk: UIButton!
   open var actionType = enumStatus.none
   open var msgtitle = "MYS_CAUTION".localized
   open var message = "message"
   open var isHiddenCancel = false
   open var isHiddenOK = false
   open var logoName = "imglogo"
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        initial()
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideAlertWhenTappedAround()
        customViewWillAppear()
        
        if lblDescription != nil && !lblDescription.text!.isEmpty{
            let descheight = lblDescription.getHeight()
            let height = self.vwAlertBox.height + descheight
            lcAlertBoxHeight.constant = height
            lcLblDescription.constant = descheight
        }
        
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func initial(){
        self.vwAlertBox.alpha = 0
        self.vwLogo.alpha = 0
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        self.vwAlertBox.cornerRadius = 8
        self.vwAlertBox.backgroundColor = UIColor.white
        self.vwAlertBox.clipsToBounds = true
        
        self.vwLogo.cornerRadius = self.vwLogo.width/2
        self.vwLogo.backgroundColor = UIColor.white
        self.imgLogo.setImage(image: UIImage(named:logoName))
        
        self.lblTitle.numberOfLines = 0
        self.lblTitle.text = msgtitle
        self.lblTitle.font = UIFont.fontWithSize(size: 14)
        
        self.lblDescription.font = UIFont.fontWithSize(size: 13)
        self.lblDescription.text = message
        self.lblDescription.numberOfLines = 0
        
        self.btnOk.setTitle("MYS_OK".localized, for: .normal)
        self.btnOk.titleLabel?.font = UIFont.defaultFont()
        self.btnOk.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        
        self.btnCancel.setTitle("MYS_CANCEL".localized, for: .normal)
        self.btnCancel.titleLabel?.font = UIFont.defaultFont()
        self.btnCancel.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        
        if isHiddenCancel{
            btnCancel.isHidden = true
            lcBtnCancelHeight.constant = 0
            lcBtnOkBottom.constant = 0
        }
        
        switch actionType {
        case .caution:

            self.btnCancel.backgroundColor = UIColor.failed
            self.btnOk.backgroundColor = UIColor.caution
        case .warning:
            
            self.btnCancel.backgroundColor = UIColor.failed
            self.btnOk.backgroundColor = UIColor.warning
        case .onProgress:
            
            self.btnCancel.backgroundColor = UIColor.failed
            self.btnOk.backgroundColor = UIColor.progress
        case .failed:
            
            self.btnCancel.backgroundColor = UIColor.failed
            self.btnOk.backgroundColor = UIColor.failed
        case .success:
        
            self.btnCancel.backgroundColor = UIColor.failed
            self.btnOk.backgroundColor = UIColor.success
        default:
            break
        }
        
    }
    
    public func customViewWillAppear(){
    
    }

    
    @objc private func hideAlertWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissViewController))
        self.view.addGestureRecognizer(tap)
    }
    @objc private func dismissViewController(){
        self.dismiss(animated: false , completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
