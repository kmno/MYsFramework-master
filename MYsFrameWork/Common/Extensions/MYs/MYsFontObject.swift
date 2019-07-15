//
//  MYsFontObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 6/20/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsFontObject: NSObject {

}
extension  UIFont {
    
    // MARK: Simple Method
//    public override convenience init() {
////        super.init()
//    }
//    convenience init(size:CGFloat) {
//        self.ini
//        self = UIFont(name: "IRANSansMobile(FaNum)", size: size)!
//    }
//
//    convenience init(size:CGFloat,name:String) {
//        self = UIFont(name: name, size: size)!
//    }
    
    public convenience init?(size:CGFloat) {
        self.init(name: "IRANSansMobile(FaNum)", size: size)
    }
    
    static public func defaultFont() -> UIFont
    {
        return UIFont(name: "IRANSansMobile(FaNum)", size: 14)!
    }
    
    
    static public func fontWithSize(size:CGFloat) -> UIFont
    {
        return UIFont(name: "IRANSansMobile(FaNum)", size: size)!
    }
    
    static public func fontWithNameAndSize(name:String, size:CGFloat) -> UIFont
    {
        var mySize : CGFloat = 14
        var myName : String = "IRANSansMobile(FaNum)"
        
        mySize = size > 0 ? size : 14
        myName = !name.isEmpty ? name : "IRANSansMobile(FaNum)"
        
        return UIFont(name: myName, size: mySize)!;
    }
    
}


