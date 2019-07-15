//
//  MYsObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 6/20/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsObject: NSObject {

}
extension NSObject {
    
    public  func ToString() -> String {
        if self == nil{
            return ""
        }
        return self as! String
    }
    
    public  func descriptionString(index:Int,items : [Any]) -> String {
        var dict = items[index] as! [String:Any]
        return dict["description"] as! String
    }
    
    
    
}

