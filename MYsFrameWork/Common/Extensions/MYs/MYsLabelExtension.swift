//
//  MYsLabelExtension.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 3/1/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

extension UILabel{
    
    public func getHeight() -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = self.font
//        label.text = self.text!.getHeight(width: self.width, font: UIFont(size: 15)!)
        label.sizeToFit()
        
        return self.text!.getHeight(width: self.width, font: UIFont(size: 15)!)
    }
    
    public func setLineSpace(height: CGFloat){
        let attributedString = NSMutableAttributedString(string: self.text!)
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = height // Whatever line spacing you want in points
        
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        // *** Set Attributed String to your label ***
        self.attributedText = attributedString
    }
}
