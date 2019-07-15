//
//  MYsBaseButton.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 12/24/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsBaseButton: UIButton {
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    public var indexPath = IndexPath()
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.titleLabel!.font = UIFont.fontWithSize(size: 15)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel!.font = UIFont.fontWithSize(size: 15)
    }
    
    open  func initial(){
        
    }
    
    public  func setGradient(colors:[UIColor], startPoint:CGPoint?, endPoint:CGPoint?){
        //* set gradient on view
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.locations = nil
        gradient.frame = self.bounds
        gradient.startPoint = startPoint == nil ? CGPoint(x: 0, y: 1) : startPoint!
        gradient.endPoint = endPoint == nil ? CGPoint(x: 1, y: 0) : endPoint!
        gradient.cornerRadius = self.cornerRadius
        gradient.colors = colors.map{ $0.cgColor }
        self.layer.insertSublayer(gradient, at: 0)
        //*
    }
    
    open func setActive(){
        
    }
    
    open func setDeactive(){
        
    }
    
    
    
//    public func addGradient(colors:[UIColor], startPoint:CGPoint?, endPoint:CGPoint?)-> CAGradientLayer{
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
}
