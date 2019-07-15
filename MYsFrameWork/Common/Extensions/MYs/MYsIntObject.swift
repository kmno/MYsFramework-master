//
//  MYsIntObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 6/20/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsIntObject: NSObject {

}
extension BinaryInteger {
    public var stringFormatedWithSepator: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value: hashValue))!
        //        return Number.formatterWithSepator.stringFromNumber(NSNumber(hashValue)) ?? ""
    }
    public  var stringFormatedWithCamma: String {let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.decimal
        // localize to your grouping and decimal separator
//        currencyFormatter.locale = Locale.current
        
        // We'll force unwrap with the !, if you've got defined data you may need more error checking
        let priceString = currencyFormatter.string(from: NSNumber(value: Int64(self)))!
        //currencyFormatter.string(from: 9999.99)!
        return priceString // Displays $9,999.99 in the US locale
        
//        let numberFormatter = NumberFormatter()
////        numberFormatter.decimalSeparator = ","
//        numberFormatter.groupingSize = 3
//        numberFormatter.groupingSeparator = ","
//        numberFormatter.usesGroupingSeparator = true
////        numberFormatter.numberStyle = NumberFormatter.Style.decimal
//        return numberFormatter.string(from: NSNumber(value: hashValue))!
//        //        return Number.formatterWithCamma.stringFromNumber(hashValue) ?? ""
    }
    
    public func ToString() -> String {
        return String(describing: self)
    }
}

struct Number {
    public  let formatterWithSepator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    public   let formatterWithCamma: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    public   let ToString: NumberFormatter = {
        let formatter = NumberFormatter()
        //        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}






extension Int32{
    
    public func toInt() -> Int {
        
        return Int(self)
    }
    
    public func toInt64() -> Int64 {
        return Int64(self)
    }
    
    public func toString() -> String {
       return  String(self)
    }
}


extension Int64{
    
    public func toInt() -> Int {
       return  Int(self)
    }
    
    public func toInt32() -> Int32 {
       return  Int32(self)
    }
    
    public func toString() -> String {
       return  String(self)
    }
}









