//
//  MYsUIBarButtonItem.swift
//  MYsFrameWork
//
//  Created by Mahdi Yousefpiur on 6/1/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

extension CAShapeLayer {
    func drawCircleAtLocation(location: CGPoint, withRadius radius: CGFloat, andColor color: UIColor, filled: Bool) {
        fillColor = filled ? color.cgColor : UIColor.white.cgColor
        strokeColor = color.cgColor
        let origin = CGPoint(x: location.x - radius, y: location.y - radius)
        path = UIBezierPath(ovalIn: CGRect(origin: origin, size: CGSize(width: radius * 2, height: radius * 2))).cgPath
    }
}

private var handle: UInt8 = 0;

extension UIBarButtonItem {
    private var badgeLayer: CAShapeLayer? {
        if let b: AnyObject = objc_getAssociatedObject(self, &handle) as AnyObject? {
            return b as? CAShapeLayer
        } else {
            return nil
        }
    }
    private var badgeView : UIView? {
        get{return self.badgeView!}
        set{}
    }
    
   open func addBadge(number: String, withOffset offset: CGPoint = CGPoint.zero, andColor color: UIColor = UIColor.red, andFilled filled: Bool = true) {
        guard let view = self.value(forKey: "view") as? UIView else { return }
        
        badgeLayer?.removeFromSuperlayer()
        
        // Initialize Badge
        let badge = CAShapeLayer()
        let radius = CGFloat(7)
        let location = CGPoint(x: view.frame.width - (radius + offset.x), y: (radius + offset.y))
        badge.drawCircleAtLocation(location: location, withRadius: radius, andColor: color, filled: filled)
        view.layer.addSublayer(badge)
        
        // Initialiaze Badge's label
        let label = CATextLayer()
        label.string = number
    label.alignmentMode = CATextLayerAlignmentMode.center
        label.fontSize = 10
        label.frame = CGRect(origin: CGPoint(x: location.x - 6, y: offset.y), size: CGSize(width: 12, height: 20))
        label.foregroundColor = filled ? UIColor.white.cgColor : color.cgColor
        label.backgroundColor = UIColor.clear.cgColor
        label.contentsScale = UIScreen.main.scale
        badge.addSublayer(label)
        
        // Save Badge as UIBarButtonItem property
        objc_setAssociatedObject(self, &handle, badge, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    open func addBadge(number: String, color: UIColor, textColor:UIColor) {
        
        if number.count < 3 {
            addBadge(number: number, withOffset: CGPoint.zero, andColor: color, andFilled: true)
        }else{
            let offset: CGPoint = CGPoint.zero
            guard let view = self.value(forKey: "view") as? UIView else { return }
            
            // Initialize Badge
            let radius = CGFloat(12)
            
            badgeView = UIView(frame: CGRect(x: view.frame.width - (radius + offset.x), y: 0, width: 24, height: 12))
            badgeView!.backgroundColor = color
            badgeView!.roundCornerRadius()
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 24, height: 16))
            label.textColor = textColor
            label.text = number.ToString()
            label.font = UIFont(size: 10)
            label.textAlignment = .center
            
            badgeView!.addSubview(label)
            view.addSubview(badgeView!)
        }
    }
    
   open  func updateBadge(number: Int) {
        if let text = badgeLayer?.sublayers?.filter({ $0 is CATextLayer }).first as? CATextLayer {
            text.string = "\(number)"
        }
    }
    
    open func removeBadge() {
        badgeLayer?.removeFromSuperlayer()
    }
}
