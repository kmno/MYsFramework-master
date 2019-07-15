//
//  MYsFrameWorkResponseModel.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 2/8/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsFrameWorkResponseModel: NSObject {
    
    public var data = [Any]()
    public var totalcount = 0
    public var code = 0
    public var title = ""
    public var status = false
    public var other = [Any]()
    public var message = ""
    public var Description = ""
    
    public func maptoModel(item : [String:Any]){
        
        if let datas = item["Data"] as? [Any]{
            self.data = datas
        }
        
        if let other = item["Other"] as? [Any]{
            self.other = other
        }
        
        if let count = item["TotalCount"] as? Int{
            self.totalcount = count
        }
        
        if let tcode = item["Code"] as? Int{
            self.code = tcode
        }
        
        if let tTitle = item["Title"] as? String{
            self.title = tTitle
        }
        
        if let tmessage = item["Message"] as? String{
            self.message = tmessage
        }
        
        if let tDescription = item["Description"] as? String{
            self.Description = tDescription
        }
        
        if let tStatus = item["Status"] as? Bool{
            self.status = tStatus
        }
    }
}
