//
//  MYsDictionary.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 3/21/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsDictionary: NSObject {

}

extension  Dictionary {
    
    public func parseToString()->String{
        do {
            if let jsonData = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted){
            // here "jsonData" is the dictionary encoded in JSON data
                return String(data: jsonData, encoding: String.Encoding.utf8)!
            }
//            let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
            // here "decoded" is of type `Any`, decoded from JSON data
            
            // you can now cast it with the right type
//            if let dictFromJSON = decoded as? [String:String] {
//                // use dictFromJSON
//            }
        } catch {
            print(error.localizedDescription)
        }
        return ""
    }
}
