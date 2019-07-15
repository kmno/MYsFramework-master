//
//  MYsViewExtension.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 8/22/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsViewExtension: UIView {

}

public extension UIView{
    
    func copyView<T: UIView>() -> T {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! T
    }
    
    
    func roundCornerRadius(size:CGFloat){
        self.layer.cornerRadius = size
    }
    func roundCornerRadius(){
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
    }
    
    func roundCornerRadius(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.masksToBounds = true
        self.layer.mask = mask
    }
    
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
    
    func addBlurEffect(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = UIScreen.main.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
    
    func insertBlureViewInZeroIndex(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.insertSubview(blurEffectView, at: 0)
    }
    
    func insertBlureViewInZero() -> UIVisualEffectView{
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.frame
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.insertSubview(blurEffectView, at: 0)
        return blurEffectView
    }
    
    func dropShadow(shadowColor:UIColor, opacity:Float, mask:Bool, rasterize:Bool, radius:CGFloat, offset:CGSize){
        //* set Shadow on view
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.masksToBounds = mask
        self.layer.shouldRasterize = rasterize
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.rasterizationScale = UIScreen.main.scale
        //*
    }
    
    func addGradient(colors:[UIColor], startPoint:CGPoint?, endPoint:CGPoint?){
        //* set gradient on view
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.name = "MYsGradient"
        gradient.locations = nil
        gradient.frame = self.bounds
        gradient.startPoint = startPoint == nil ? CGPoint(x: 0, y: 0.5) : startPoint!
        gradient.endPoint = endPoint == nil ? CGPoint(x: 0, y: 0.5) : endPoint!
        gradient.cornerRadius = self.layer.cornerRadius
        gradient.colors = colors.map{ $0.cgColor }
        self.layer.insertSublayer(gradient, at: 0)
        //*
    }
    
    func getGradient(colors:[UIColor], startPoint:CGPoint?, endPoint:CGPoint?)->CAGradientLayer{
        //* set gradient on view
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.name = "MYsGradient"
        gradient.locations = nil
        gradient.frame = self.frame
        gradient.startPoint = startPoint == nil ? CGPoint(x: 0, y: 0.5) : startPoint!
        gradient.endPoint = endPoint == nil ? CGPoint(x: 0, y: 0.5) : endPoint!
        gradient.cornerRadius = self.layer.cornerRadius
        gradient.colors = colors.map{ $0.cgColor }
        return gradient
        //*
    }
    
    func getGradient(frame:CGRect,colors:[UIColor], startPoint:CGPoint?, endPoint:CGPoint?)->CAGradientLayer{
        //* set gradient on view
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.name = "MYsGradient"
        gradient.locations = nil
        gradient.frame = frame
        gradient.startPoint = startPoint == nil ? CGPoint(x: 0, y: 0.5) : startPoint!
        gradient.endPoint = endPoint == nil ? CGPoint(x: 0, y: 0.5) : endPoint!
        gradient.cornerRadius = self.layer.cornerRadius
        gradient.colors = colors.map{ $0.cgColor }
        return gradient
        //*
    }
    
    func takeSnapshot() -> UIImage {
        var tframe = frame
        tframe.size.width = tframe.size.width + 10
        frame = tframe
        UIGraphicsBeginImageContextWithOptions(tframe.size, false, UIScreen.main.scale)
        
        drawHierarchy(in: tframe, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

    func addDotLine(){
        let path = UIBezierPath()
        path.move(to: CGPoint(x:10,y:10))
        path.addLine(to: CGPoint(x:self.frame.width,y:10))
        path.lineWidth = 4
        
        let dashes: [CGFloat] = [0.001, path.lineWidth * 2]
        path.setLineDash(dashes, count: dashes.count, phase: 0)
        path.lineCapStyle = CGLineCap.round
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width:self.frame.width - 10, height:self.frame.height), false, 2)
        
        UIColor.clear.setFill()
        UIGraphicsGetCurrentContext()!.fill(.infinite)
        
        UIColor.black.setStroke()
        path.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysTemplate)
        let view = UIImageView(image: image)
        view.tintColor = UIColor("#CCD1D6")
        view.backgroundColor = .clear
        self.addSubview(view)
        
        UIGraphicsEndImageContext()
    }
    
    func rotate360Degrees(duration: CFTimeInterval = 1.0,velocity:Float,repeatcount:Float, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(.pi * velocity)
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = repeatcount
        if let delegate: CAAnimationDelegate = completionDelegate as! CAAnimationDelegate? {
            rotateAnimation.delegate = delegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
    
    func setZeroHeight(){
        let frame = CGRect(x: self.x, y: self.y, width: self.width, height: self.frame.midY)
        self.frame = frame
        self.translatesAutoresizingMaskIntoConstraints = true
        self.layoutIfNeeded()
    }
    
    func setZeroHeight(height:CGFloat){
        let frame = CGRect(x: self.x, y: self.y, width: self.width, height: height)
        self.frame = frame
        self.translatesAutoresizingMaskIntoConstraints = true
        self.layoutIfNeeded()
    }
    
    func delay(delay:Double, complition:@escaping ()->()){
        MYsUtilities.delay(delay, closure: complition)
    }
    
    func fadeIn(){
        MYsUtilities.delay(0.4) {
            self.alpha = 1
        }
    }
    
    func fadeOut(){
        MYsUtilities.delay(0.4) {
            self.alpha = 0
        }
    }
    
    func fadeIn(tx:CGFloat,ty:CGFloat,duration: TimeInterval){
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
            self.transform = CGAffineTransform(translationX: tx, y: ty)
        })
    }
    
    func fadeOut(tx:CGFloat,ty:CGFloat,duration: TimeInterval){
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
            self.transform = CGAffineTransform(translationX: tx, y: ty)
        })
    }
}


open class UnderLineView: UIView {
    @IBInspectable public  var strokeColor: UIColor = UIColor.black {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public  var lineWidth: CGFloat = 2.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public  var marginX: CGFloat = 0.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    public init() {
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.clear
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        strokeColor.setStroke()
        context.setLineWidth(lineWidth)
        context.move(to: CGPoint(x: rect.minX + marginX, y: rect.maxY))
        context.addLine(to: CGPoint(x: rect.maxX - marginX, y: rect.maxY))
        context.strokePath()
    }
    
    
    
}
