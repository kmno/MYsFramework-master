//
//  MYsDataObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 6/20/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsDataObject: NSObject {

}
extension Data {
    
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    public  var parseJSONArray: NSMutableArray? {
        do {
            let jsonString = try JSONSerialization.jsonObject(with: self as Data, options: .mutableContainers)
            let jsonArray = jsonString as? NSMutableArray
            return jsonArray
        }
        catch {
            return nil
        }
    }

    public var parseToString : String{
        do {
            if let str = String(data: self, encoding: .utf8){
                return str
            }
            return ""
        }
    }
    
    public var parseToDictionary : [String:Any]{
        do {
            if let dic = try JSONSerialization.jsonObject(with: self as Data, options: []) as? [String: Any]{
                return dic
            }
            return [String : Any]()
        }
        catch {
            return [String : Any]()
        }
    } 
    
    public var parseToArray : [Any]{
        do {
            if let dic = try JSONSerialization.jsonObject(with: self as Data, options: []) as? [Any]{
                return dic
            }
            return [Any]()
        }
        catch {
            return [Any]()
        }
    }
    
    //    func MD5() -> NSString {
    //        let digestLength = Int(CC_MD5_DIGEST_LENGTH)
    //        let md5Buffer = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLength)
    //
    //        CC_MD5(bytes, CC_LONG(length), md5Buffer)
    //        let output = NSMutableString(capacity: Int(CC_MD5_DIGEST_LENGTH * 2))
    //        for i in 0..<digestLength {
    //            output.appendFormat("%02x", md5Buffer[i])
    //        }
    //
    //        return NSString(format: output)
    //    }
    
}
