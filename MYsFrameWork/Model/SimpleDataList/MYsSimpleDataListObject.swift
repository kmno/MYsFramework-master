//
//  MYsSimpleDataListObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 12/24/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

public class MYsSimpleDataListObject: NSObject {
    public var id = ""
    public var title = ""
    public var name = ""
    public var logo = ""
    public var value = ""
    public var tag = ""
    
    public func maptoModel(item:[String:Any]) ->MYsSimpleDataListObject{
        if let Id = item["id"]as? String{
            id = Id
        }
        if let tTitle = item["title"]as? String{
            title = tTitle
        }else if let tTitle = item["Title"]as? String{
            title = tTitle
        }else if let tTitle = item["name"]as? String{
            title = tTitle
        }else if let tTitle = item["Name"]as? String{
            title = tTitle
        }
        return self
    }
    
    public static func maptoModels(items:[Any]) ->[MYsSimpleDataListObject]{
        var models = [MYsSimpleDataListObject]()
        for index in items {
            let item = index as! [String:Any]
            let model = MYsSimpleDataListObject()
            if let Id = item["id"]as? String{
                model.id = Id
            }else if let Id = item["id"]as? Int{
                model.id = Id.ToString()
            }

            if let tTitle = item["title"]as? String{
                model.title = tTitle
            }else if let tTitle = item["Title"]as? String{
                model.title = tTitle
            }
            if let tlogo = item["logo"]as? String{
                model.logo = tlogo
            }else if let tlogo = item["Logo"]as? String{
                model.logo = tlogo
            }
            
            if let tname = item["name"]as? String{
                model.name = tname
            }else if let tname = item["Name"]as? String{
                model.name = tname
            }
            
            if let tvalue = item["value"]as? String{
                model.value = tvalue
            }else if let tvalue = item["Value"]as? String{
                model.value = tvalue
            }
            models.append(model)
        }
        return models
    }
    
    
    
}

extension Array where Element:MYsSimpleDataListObject {
//    func sort() -> [MYsSimpleDataListObject] {
//        return sort { $0.title < $1.title }
//    }
    
}
