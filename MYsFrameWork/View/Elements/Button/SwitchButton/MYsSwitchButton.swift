//
//  MYsSwitchButton.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 12/25/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsBaseSwitchButton: MYsBaseButton {

    public var buttonLeft = MYsBaseDefaultButton()
    public var buttonRight = MYsBaseDefaultButton()
    public var buttonShadow = MYsBaseDefaultButton()
    var isAddedView = false
    public var completionHandlerLeft: ()->Void = {}
    public var completionHandlerRight: ()->Void = {}
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initial()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel!.font = UIFont.fontWithSize(size: 15)
    }
    
    open  override func initial() {
        
        self.titleLabel!.font = UIFont.fontWithSize(size: 15)
        self.setTitle("", for: .normal)
        self.borderColor = .white
        self.borderWidth = 1
        
        
        
        self.cornerRadius = self.height / 2
        self.clipsToBounds = false
    }
    
    @objc open func selectedButton(sender:UIButton) {
        if sender.tag == 0{
            UIView.animate(withDuration: 0.3, animations: {
                self.buttonShadow.cornerRadius = self.buttonShadow.height / 2
                self.buttonShadow.transform = CGAffineTransform(translationX: self.buttonLeft.x - 2, y: 0)
//                self.buttonShadow.backgroundColor = .white
                self.buttonShadow.tag = sender.tag
                self.buttonLeft.setTitleColor(UIColor("#015FAC"), for: .normal)
                self.buttonRight.setTitleColor(.white, for: .normal)
                self.buttonRight.backgroundColor = .clear
                self.buttonLeft.backgroundColor = .clear
                self.completionHandlerLeft()
            })
        }else{
            UIView.animate(withDuration: 0.3, animations: {
                let spacefromRight : CGFloat = UIDevice.IsIPhone5 ? 0 : 2
                self.buttonShadow.cornerRadius = self.buttonShadow.height / 2
                self.buttonShadow.transform = CGAffineTransform(translationX: self.buttonRight.x + spacefromRight, y: 0)
                self.buttonShadow.backgroundColor = .white
                self.buttonShadow.tag = sender.tag
                self.buttonRight.backgroundColor = .clear
                self.buttonLeft.backgroundColor = .clear
                self.buttonRight.setTitleColor(UIColor("#015FAC"), for: .normal)
                self.buttonLeft.setTitleColor(.white, for: .normal)
                self.completionHandlerRight()
            })
        }
    }
    
    
    open func setSubButton(){
        if !isAddedView{
//            let widths = MYsUtilities.checkDeviceAndGetResult(iphone4: 280, iphone5: 280, iphone6: 300, iphoneX: 300, iphonePlus: 350, ipadmini: 400, ipadair: 450, ipadpro: 450)
//            if UIDevice.IsIPhone5{
//                let widths = CGFloat(280)
//                buttonShadow = MYsBaseDefaultButton(frame: CGRect(x: 2, y: 2, width: Int(widths / 2 - 3)  , height: Int(self.height - 4)))
//                buttonShadow.setTitle("", for: .normal)
//                buttonShadow.cornerRadius = buttonShadow.height / 2
//                buttonShadow.backgroundColor = .white
//                self.addSubview(buttonShadow)
//
//                buttonLeft = MYsBaseDefaultButton(frame: CGRect(x: 2, y: 0, width: Int(widths / 2 - 10) , height: Int(self.height)))
//                buttonLeft.tag = 0
//                buttonLeft.setTitle("Left", for: .normal)
//                buttonLeft.cornerRadius = buttonLeft.height / 2
//                buttonLeft.addTarget(self, action: #selector(selectedButton(sender:)), for: .touchUpInside)
//                self.addSubview(buttonLeft)
//
//                buttonRight = MYsBaseDefaultButton(frame: CGRect(x: widths / 2 , y: 0, width: widths / 2  , height: self.height))
//                buttonRight.tag = 1
//                buttonRight.setTitle("Right", for: .normal)
//                buttonRight.cornerRadius = buttonRight.height / 2
//                buttonRight.addTarget(self, action: #selector(selectedButton(sender:)), for: .touchUpInside)
//                self.addSubview(buttonRight)
//            }else if UIDevice.IsIPhone6 || UIDevice.IsIPhoneX {
//                let widths = CGFloat(332)
//                buttonShadow = MYsBaseDefaultButton(frame: CGRect(x: 2, y: 2, width: Int(widths / 2 - 3)  , height: Int(self.height - 4)))
//                buttonShadow.setTitle("", for: .normal)
//                buttonShadow.cornerRadius = buttonShadow.height / 2
//                buttonShadow.backgroundColor = .white
//                self.addSubview(buttonShadow)
//
//                buttonLeft = MYsBaseDefaultButton(frame: CGRect(x: 2, y: 0, width: Int(widths / 2 - 10) , height: Int(self.height)))
//                buttonLeft.tag = 0
//                buttonLeft.setTitle("Left", for: .normal)
//                buttonLeft.cornerRadius = buttonLeft.height / 2
//                buttonLeft.addTarget(self, action: #selector(selectedButton(sender:)), for: .touchUpInside)
//                self.addSubview(buttonLeft)
//
//                buttonRight = MYsBaseDefaultButton(frame: CGRect(x: widths / 2 , y: 0, width: widths / 2  , height: self.height))
//                buttonRight.tag = 1
//                buttonRight.setTitle("Right", for: .normal)
//                buttonRight.cornerRadius = buttonRight.height / 2
//                buttonRight.addTarget(self, action: #selector(selectedButton(sender:)), for: .touchUpInside)
//                self.addSubview(buttonRight)
//            }
            MYsUtilities.delay(0.1233456789) {
                self.buttonShadow = MYsBaseDefaultButton(frame: CGRect(x: 2, y: 2, width: self.width / 2 - 3  , height: self.height - 4))
                self.buttonShadow.setTitle("", for: .normal)
                self.buttonShadow.cornerRadius = self.buttonShadow.height / 2
//                self.buttonShadow.backgroundColor = .red
                if !self.subviews.contains(self.buttonShadow){
                    self.addSubview(self.buttonShadow)
                }
                
                
                self.buttonLeft = MYsBaseDefaultButton(frame: CGRect(x: 2, y: 0, width: self.width / 2 - 10 , height: self.height))
                self.buttonLeft.tag = 0
                self.buttonLeft.setTitle("", for: .normal)
                self.buttonLeft.cornerRadius = self.buttonLeft.height / 2
                self.buttonLeft.addTarget(self, action: #selector(self.selectedButton(sender:)), for: .touchUpInside)
                self.addSubview(self.buttonLeft)
                
                self.buttonRight = MYsBaseDefaultButton(frame: CGRect(x: (self.width / 2 - 4), y: 0, width: self.width / 2  , height: self.height))
                self.buttonRight.tag = 1
                self.buttonRight.setTitle("", for: .normal)
                self.buttonRight.cornerRadius = self.buttonRight.height / 2
                self.buttonRight.addTarget(self, action: #selector(self.selectedButton(sender:)), for: .touchUpInside)
                self.addSubview(self.buttonRight)
                self.isAddedView = true
            }
        }
    }
    
    public func addBlueGreenGradient(){
        MYsUtilities.delay(0.1) {
            UIView.animate(withDuration: 0.3) {
                self.addGradient(colors: [UIColor("#2D7ABF"),UIColor("#009688")], startPoint: CGPoint(x: 0, y: 1), endPoint: CGPoint(x: 1, y: 0))
//                self.layer.insertSublayer(gradient, at: 0)
            }
        }
    }
    
//    public override func addGradient(colors:[UIColor], startPoint:CGPoint?, endPoint:CGPoint?)-> CAGradientLayer{
//        //* set gradient on view
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.locations = nil
//        gradient.frame = self.bounds
//        gradient.startPoint = startPoint == nil ? CGPoint(x: 0, y: 1) : startPoint!
//        gradient.endPoint = endPoint == nil ? CGPoint(x: 1, y: 0) : endPoint!
//        gradient.cornerRadius = self.cornerRadius
//        gradient.colors = colors.map{ $0.cgColor }
//        //*
//        return gradient
//    }
//    
    
    
    
    
    
    
    
    
    
}
