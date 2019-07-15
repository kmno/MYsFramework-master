//
//  MYsColorObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 6/20/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsColorObject: NSObject {
    
}

extension  UIColor {
    
    // MARK: Custom Color
    
    
    @nonobjc public static var special1 = UIColor.clear
    @nonobjc public static var special2 = UIColor.clear
    @nonobjc public static var special3 = UIColor.clear
    @nonobjc public static var imageTint = UIColor.clear
    @nonobjc public static var link = UIColor.clear
    @nonobjc public static var done = UIColor.clear
    @nonobjc public static var other = UIColor.clear
    @nonobjc public static var cancel = UIColor.clear
    @nonobjc public static var normal = UIColor.clear
    
    // Button
    
    @nonobjc public static var backgroundDefaultButton = UIColor.clear
    @nonobjc public static var textDefaultButton = UIColor.clear
    @nonobjc public static var borderDefaultButton = UIColor.clear
    
    @nonobjc public static var backgroundDoneButton = UIColor.clear
    @nonobjc public static var textDoneButton = UIColor.clear
    @nonobjc public static var borderDoneButton = UIColor.clear
    
    @nonobjc public static var backgroundCancelButton = UIColor.clear
    @nonobjc public static var textCancelButton = UIColor.clear
    @nonobjc public static var borderCancelButton = UIColor.clear
    
    @nonobjc public static var backgroundLinkButton = UIColor.clear
    @nonobjc public static var textLinkButton = UIColor.clear
    @nonobjc public static var borderLinkButton = UIColor.clear
    
    
    
    @nonobjc public static var moreBackgroundButton = UIColor.clear
    @nonobjc public static var doneButton = UIColor.clear
    @nonobjc public static var doneBackgroundButton = UIColor.clear
    @nonobjc public static var borderButton = UIColor.clear
    @nonobjc public static var otherBackgroundButton = UIColor.clear
    
    @nonobjc public static var alertDoneBackgroundButton = UIColor.clear
    @nonobjc public static var alertDoneBorderButton = UIColor.clear
    @nonobjc public static var alertDoneButton = UIColor.clear
    @nonobjc public static var alertCancelBackgroundButton = UIColor.clear
    @nonobjc public static var alertCancelBorderButton = UIColor.clear
    @nonobjc public static var alertCanceButton = UIColor.clear
    
    @nonobjc public static var more = UIColor.clear
    @nonobjc public static var old = UIColor.clear
    @nonobjc public static var price = UIColor.clear
    @nonobjc public static var date = UIColor.clear
    @nonobjc public static var rate = UIColor.clear
    @nonobjc public static var defaultColor = UIColor.clear
    @nonobjc public static var active = UIColor.clear
    @nonobjc public static var deActive = UIColor.clear
    @nonobjc public static var discountt = UIColor.clear
    @nonobjc public static var highLight = UIColor.clear
    
    
    // TextField
    @nonobjc public static var textFieldTextColor               = UIColor()
    @nonobjc public static var textFieldBackgroundColor         = UIColor()
    @nonobjc public static var textFieldActiveBackgroundColor   = UIColor()
    @nonobjc public static var textFieldHintTextColor           = UIColor()
    @nonobjc public static var textFieldActiveTextColor         = UIColor()
    @nonobjc public static var textFieldShadowColor             = UIColor()
    @nonobjc public static var textFieldBorderColor             = UIColor()
    
    @nonobjc public static var textLabelBackground = UIColor.clear
    @nonobjc public static var textFieldBackground = UIColor.clear
    @nonobjc public static var textFieldFailedBackground = UIColor.clear
    @nonobjc public static var textFieldSucceedBackground = UIColor.clear
    @nonobjc public static var textFieldFailedBorder = UIColor.clear
    @nonobjc public static var textFieldSelectedBorder = UIColor.clear
    @nonobjc public static var textField = UIColor.clear
    @nonobjc public static var placeHolder = UIColor.clear
    @nonobjc public static var label = UIColor.clear
    @nonobjc public static var subtitle = UIColor.clear
    
    @nonobjc public static var headerTitle = UIColor.clear
    @nonobjc public static var title = UIColor.clear
    @nonobjc public static var caption = UIColor.clear
    @nonobjc public static var content = UIColor.clear
    @nonobjc public static var details = UIColor.clear
    @nonobjc public static var plainText = UIColor.clear
    @nonobjc public static var selected = UIColor.clear
    @nonobjc public static var description = UIColor.clear
    @nonobjc public static var specialTitle = UIColor.clear
    
    // Line
    @nonobjc public static var line = UIColor.clear
    @nonobjc public static var border = UIColor.clear
    @nonobjc public static var selectedBorder = UIColor.clear
    
    // Gradient
    @nonobjc public static var background = UIColor.clear
    @nonobjc public static var beginGradient = UIColor.clear
    @nonobjc public static var endGradient = UIColor.clear
    @nonobjc public static var beginSpecialGradient = UIColor.clear
    @nonobjc public static var endSpecialGradient = UIColor.clear
    
    
    // Tabbar
    @nonobjc public static var tabBar = UIColor.clear
    @nonobjc public static var tabBarItem = UIColor.clear
    @nonobjc public static var tabBarHighlite = UIColor.clear
    @nonobjc public static var tabBarBackgorund = UIColor.clear
    
    
    // Navigation Bar
    @nonobjc public static var navigationBar = UIColor.clear
    @nonobjc public static var navigationBarTint = UIColor.clear
    @nonobjc public static var navigationText = UIColor.clear
    @nonobjc public static var navigationItem = UIColor.clear
    
    @nonobjc public static var caution = UIColor.clear
    @nonobjc public static var progress = UIColor.clear
    
    // TableView
    @nonobjc public static var backgroundHeaderSection = UIColor.clear
    @nonobjc public static var backgroundFooterSection = UIColor.clear
    @nonobjc public static var backgroundHeaderView = UIColor.clear
    @nonobjc public static var backgroundFooterView = UIColor.clear
    @nonobjc public static var selectedCell = UIColor.clear
    
    // Status
    @nonobjc static public var error = UIColor.rgbColor(r: 179, g: 29, b: 0)
    @nonobjc static public var failed = UIColor.rgbColor(r: 179, g: 29, b: 0)
    @nonobjc static public var success = UIColor.rgbColor(r: 0, g: 177, b: 112)
    @nonobjc static public var warning = UIColor.rgbColor(r: 246, g: 154, b: 57)
    @nonobjc static public var info = UIColor.rgbColor(r: 24, g: 158, b: 247)
    @nonobjc public static var statusBackground = UIColor.clear
    @nonobjc public static var statusColor = UIColor.clear
    
    
    @nonobjc public static var fwTextFieldText = UIColor.black
    @nonobjc public static var fwTextFieldPlaceHolder = UIColor.lightGray
    @nonobjc public static var fwTextFieldBorder = UIColor.clear
    
    
    
    
    // MARK: Simple Method
//
//    public func init(r: CGFloat,g:CGFloat,b:CGFloat)-> UIColor{
//        let color = UIColor(red: r/256, green: g/256, blue: b/256, alpha: 1)
//        return color
//    }
    
    public static func rgbaColor(r: CGFloat , g:CGFloat , b:CGFloat,a:CGFloat)->UIColor {
        let color = UIColor(red: r/256, green: g/256, blue: b/256, alpha: a)
        return color
    }
    
    public static func rgbColor(r: CGFloat,g:CGFloat,b:CGFloat)-> UIColor{
        let color = UIColor(red: r/256, green: g/256, blue: b/256, alpha: 1)
        return color
    }
    
    public static func CGColor(
        r: CGFloat,g:CGFloat,b:CGFloat)-> CGColor{
        let color = UIColor(red: r/256, green: g/256, blue: b/256, alpha: 1)
        return color.cgColor
    }
    
    public static func hexStringColor (_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines as CharacterSet).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 1))
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    public static func applyGradient(layer: CALayer, colours: [UIColor]) {
        self.applyGradient(layer:layer, colours: colours, locations: nil)
        
    }
    
    public static func applyGradient(layer: CALayer,colours: [UIColor], locations: [NSNumber]?)  {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = layer.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        layer.insertSublayer(gradient, at: 0)
    }
    
    convenience init(_ hex:String) {
        var cString:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines as CharacterSet).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 1))
        }
        
        if ((cString.count) != 6) {
            self.init()
        }else{
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            
            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        }
    }
    
}

