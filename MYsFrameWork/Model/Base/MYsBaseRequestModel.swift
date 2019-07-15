//
//  MYsRequestModel.swift
//  IHTVSwift
//
//  Created by mahdi yousefpour on 2/17/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import Foundation
open class MYsBaseRequestModel:NSObject{
    public var header = [String:String]()
    public var parametes = [String:Any]()
    public var files = [MYsFileUploadModel]()
    
}


