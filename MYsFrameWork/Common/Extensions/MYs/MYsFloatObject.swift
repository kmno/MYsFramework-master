//
//  MYsFloatObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 6/20/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsFloatObject: NSObject {

}
extension Float {
    public var stringFormatedWithSepator: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value: hashValue))!
        //        return NSNumber.formatterWithSepator.stringFromNumber(hashValue) ?? ""
    }
    public var stringFormatedWithCamma: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = hashValue
        return formatter.string(from: NSNumber(value: 8.0))!
        
        //        return NSNumber.formatterWithCamma.stringFromNumber(hashValue) ?? ""
    }
    
    public func ToString() -> String {
        return String(self)
    }
}
