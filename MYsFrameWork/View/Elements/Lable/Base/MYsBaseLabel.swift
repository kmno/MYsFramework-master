//
//  MYsBaseLabel.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 12/25/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsBaseLabel: UILabel {

//    open override var text: String?{
//        didSet{
//            self.text = text?.localized
//        }
//    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        initial()
        
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initial()
    }
    
    open func initial(){
        self.font = UIFont.fontWithSize(size: 14)
        if let dir = MYsUtilities.getUserDefault(key: "isRTL") as? Bool{
            self.textAlignment = .right
        }else{
            self.textAlignment = .left
        }
    }
    
    open func setGradient(colors:[UIColor], startPoint:CGPoint?, endPoint:CGPoint?){
        //* set gradient on view
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.locations = nil
        gradient.frame = self.bounds
        gradient.startPoint = startPoint == nil ? CGPoint(x: 0, y: 0.5) : startPoint!
        gradient.startPoint = endPoint == nil ? CGPoint(x: 0, y: 0.5) : endPoint!
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.cornerRadius = self.layer.cornerRadius
        gradient.colors = colors.map{ $0.cgColor }
        self.layer.insertSublayer(gradient, at: 0)
        //*
    }

}
