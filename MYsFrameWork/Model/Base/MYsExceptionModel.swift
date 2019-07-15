//
//  MYsExceptionModel.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 2/6/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit


/**
 MYs Exception Model
 
 @code : error code
 
 @status : error Status
 @message : some description error
 @title : some tilte to show error
 @colors : set inorder colro (error Color,title color and details color)
 */

public class MYsExceptionModel: NSObject {
    public var code = Int()
    public var status = enumStatus.none
    public var message = String()
    public var title = String()
    public var titleColor = [UIColor]()
    
    public init(error:String) {
        super.init()
        self.setMessage(error: error)
    }
    
    public init(title:String,error:String) {
        super.init()
        self.title = title
        self.setMessage(error: error)
    }
    
    func setMessage(error:String){
        switch error {
        case "bad Request.":
            self.code = 400
            self.message = MYsCaptions().BADREQUEST
            
        case "The request timed out.":
            self.code = 408
            self.message = MYsCaptions().REQUESTTIMEOUT
            
        case "Unauthorized":
            self.code = 401
            self.message = MYsCaptions().BADREQUEST
            
        case "Forbidden":
            self.code = 403
            self.message = MYsCaptions().BADREQUEST
            
        case "Not Found":
            self.code = 404
            self.message = MYsCaptions().BADREQUEST
            
        case "Internal Server Error":
            self.code = 500
            self.message = MYsCaptions().BADREQUEST
            
        case "Web Server Is Down":
            self.code = 521
            self.message = MYsCaptions().BADREQUEST
            
        case "Internet was not connect!":
            self.code = 1
            self.message = MYsCaptions().INTERNETNOTCONNECTED
            
        case "The network connection was lost.":
            self.code = 2
            self.message = MYsCaptions().NETWORKNOTCONNECTED
            
        default:
            
            self.message = MYsCaptions().REQUESTTIMEOUT
        }
    }
}
