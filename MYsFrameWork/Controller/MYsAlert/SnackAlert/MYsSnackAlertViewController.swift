//
//  MYsSnackAlertViewController.swift
//  MYsFrameWork
//
//  Created by Malihe dabbaghi on 3/3/19.
//  Copyright © 2019 MYs. All rights reserved.
//

import UIKit

public class MYsSnackAlertViewController: MYsAlertViewController {
    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var vwTop: UIView!
    @IBOutlet weak var vwBottom: UIView!
    @IBOutlet weak var lcVwTop: NSLayoutConstraint!
    @IBOutlet weak var lcVwBottom: NSLayoutConstraint!
    @IBOutlet weak var lblTopMsg: MYsDefaultLable!
    @IBOutlet weak var lblBottomMsg: MYsDefaultLable!
    public var textColor = UIColor.caption
    public var backgroundColor = UIColor.failed
    public var isFailed = true
    public var time = CGFloat(1.6)
    public var isShowBottomSnack = false
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.vwBottom.transform = CGAffineTransform(translationX: 0, y: 200)
        self.vwTop.transform = CGAffineTransform(translationX: 0, y: -200)
        self.vwBottom.isHidden =  isShowBottomSnack
        self.vwTop.isHidden =  !isShowBottomSnack
        
        
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MYsUtilities.delay(0.12345678) {
            self.initial()
        }
    }
    
    
    
    // MARK: Custom Methode
    
    override public func initial() {
        self.vwBottom.cornerRadius = 5
        self.vwTop.cornerRadius = 5
        
        self.vwContainer.backgroundColor = .clear
        self.view.backgroundColor = .clear
        
        self.lblTopMsg.textColor = textColor
        self.lblBottomMsg.textColor = textColor
        self.vwTop.backgroundColor = backgroundColor
        self.vwBottom.backgroundColor = backgroundColor
        
        if isFailed {
            self.vwTop.backgroundColor = UIColor.failed
            self.vwBottom.backgroundColor = UIColor.failed
        }else{
            switch actionType {
            case .caution:
                
                self.vwTop.backgroundColor = self.backgroundColor
                self.vwBottom.backgroundColor = self.backgroundColor
            case .warning:
                
                self.vwTop.backgroundColor = self.backgroundColor
                self.vwBottom.backgroundColor = self.backgroundColor
                self.lblBottomMsg.textColor = .black
                self.lblTopMsg.textColor = .black
            case .onProgress:
                
                self.vwTop.backgroundColor = self.backgroundColor
                self.vwBottom.backgroundColor = self.backgroundColor
            case .failed:
                
                self.vwTop.backgroundColor = self.backgroundColor
                self.vwBottom.backgroundColor = self.backgroundColor
            case .success:
                
                self.vwTop.backgroundColor = self.backgroundColor
                self.vwBottom.backgroundColor = self.backgroundColor
            default:
                break
            }
        }
        
        self.lblTopMsg.font = UIFont(size: 13)
        self.lblBottomMsg.font = UIFont(size: 13)
        self.lblTopMsg.text = self.message
        self.lblBottomMsg.text = self.message
        self.lblTopMsg.textColor = textColor
        self.lblBottomMsg.textColor = textColor
        let height = lblTopMsg.text!.getHeight(width: self.view.width, font: UIFont(size: 15)!)
        lcVwTop.constant = height < 60 ? 60 : height
        lcVwBottom.constant = lcVwTop.constant
        moveToZeroPosition()
    }
    
    func moveToZeroPosition(){
        UIView.animate(withDuration: 0.3) {
            self.vwBottom.transform = CGAffineTransform(translationX: 0, y: 0)
            self.vwTop.transform = CGAffineTransform(translationX: 0, y: 0)
        }
        
        MYsUtilities.delay(Double(time)) {
            self.moveToHiddenPosition()
        }
    }
    
    func moveToHiddenPosition(){
        UIView.animate(withDuration: 0.3, animations: {
            self.vwBottom.transform = CGAffineTransform(translationX: 0, y: 200)
            self.vwTop.transform = CGAffineTransform(translationX: 0, y: -200)
        }) { (flag) in
            if flag{
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
