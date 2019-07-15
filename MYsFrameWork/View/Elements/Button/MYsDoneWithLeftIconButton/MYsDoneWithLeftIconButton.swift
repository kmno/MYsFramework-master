//
//  MYsSekeButton.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 12/24/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsBaseDoneWithLeftIconButton: MYsBaseButton {

    var isLoading = false
    public var IconImage = UIImage(named:"icskh_forward_withe")
    public var buttonIcon = UIButton()
    public var buttonIconRight = UIButton()
    public var activityIndicator = UIActivityIndicatorView()
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //initial()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel!.font = UIFont.fontWithSize(size: 15)
    }
    
    open override func initial() {
        super.initial()
        self.titleLabel!.font = UIFont.fontWithSize(size: 15)
        buttonIcon = UIButton(frame: CGRect(x: -6, y: 0, width: self.height, height: self.height))
        buttonIconRight = UIButton(frame: CGRect(x: (self.width - self.height), y: 0, width: self.height, height: self.height))
        activityIndicator = UIActivityIndicatorView(frame: buttonIcon.frame)
        activityIndicator.isHidden = true
        
        buttonIcon.cornerRadius = buttonIcon.height / 2
        self.addSubview(buttonIcon)
        //self.addSubview(buttonIconRight)
        self.addSubview(activityIndicator)
        
        
        self.cornerRadius = self.height / 2
        self.clipsToBounds = false
    }
    
    open func initialBlueButton() {
        initial()
        self.backgroundColor = UIColor("#015FAC")
        buttonIcon.setImage(UIImage(named:"icskh_forward_withe"), for: .normal)
        buttonIcon.backgroundColor = UIColor("#2D7ABF")
        buttonIconRight.setImage(UIImage(named:"icskh_forward_withe"), for: .normal)
        buttonIconRight.backgroundColor = UIColor("#2D7ABF")
        self.buttonIconRight.roundCornerRadius()
        MYsUtilities.delay(0.3) {
            self.buttonIconRight = UIButton(frame: CGRect(x: (self.width - self.height), y: 0, width: self.height, height: self.height))
        }
        
    }
    
    open func initialButton(backgroundColor: UIColor) {
        initial()
        self.backgroundColor = UIColor("#015FAC")
        buttonIcon.setImage(UIImage(named:"icskh_forward_withe"), for: .normal)
        buttonIcon.backgroundColor = backgroundColor
        buttonIconRight.setImage(UIImage(named:"icskh_forward_withe"), for: .normal)
        buttonIconRight.backgroundColor = UIColor("#2D7ABF")
        self.buttonIconRight.roundCornerRadius()
        MYsUtilities.delay(0.3) {
            self.buttonIconRight = UIButton(frame: CGRect(x: (self.width - self.height), y: 0, width: self.height, height: self.height))
        }
        
    }
    
    public func addBlueGradient() {
        MYsUtilities.delay(0.1) {
            UIView.animate(withDuration: 0.3) {
                self.addGradient(colors: [UIColor("#015FAC"),UIColor("#2D7ABF")], startPoint: CGPoint(x: 0, y: 1), endPoint: CGPoint(x: 1, y: 0))
            }
        }
    }
    
    public func addGradientColor(beginColor: UIColor, endColor: UIColor) {
        MYsUtilities.delay(0.1) {
            UIView.animate(withDuration: 0.3) {
                self.addGradient(colors: [beginColor,endColor], startPoint: CGPoint(x: 0, y: 1), endPoint: CGPoint(x: 1, y: 0))
            }
        }
    }
    
    
    
    open func initialGoldButton(){
        initial()
        self.backgroundColor = UIColor("#FFD340")
        buttonIcon.setImage(UIImage(named:"icskh_forward_withe"), for: .normal)
        buttonIcon.backgroundColor = UIColor("#F3B619")
        buttonIconRight.setImage(UIImage(named:"icskh_forward_withe"), for: .normal)
        buttonIconRight.backgroundColor = UIColor("#F3B619")
        self.buttonIconRight.roundCornerRadius()
        MYsUtilities.delay(0.3) {
            self.buttonIconRight = UIButton(frame: CGRect(x: (self.width - self.height), y: 0, width: self.height, height: self.height))
        }
        
    }
    
    public func addGoldGradient(){
        MYsUtilities.delay(0.1) {
            UIView.animate(withDuration: 0.3) {
                self.addGradient(colors: [UIColor("#FFD340"),UIColor("#F3B619")], startPoint: CGPoint(x: 0, y: 1), endPoint: CGPoint(x: 1, y: 0))
            }
        }
        
    }
    
    public func showLoadIndicator(){
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        buttonIcon.setImage(UIImage(named:""), for: .normal)
        buttonIconRight.setImage(UIImage(named:""), for: .normal)
    }
    
    public func hideLoadIndicator(){
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        buttonIcon.setImage(IconImage, for: .normal)
    }

    public func toggleLoading(){
        if !isLoading {
            showLoadIndicator()
            isLoading = true
        }else{
            hideLoadIndicator()
            isLoading = false
        }
    }
    
}
