//
//  MYsBaseDataModel.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 8/18/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsBaseServiceModel: NSObject {
    public var mainURL = String()
    public var endPointURL = String()
    public var version = String()
    public var params = [String:Any]()
    public var headers = [String:String]()
    public var queryString = String()
    public var responseData : Data?
    public var responseArray = [Any]()
    public var otherObjectArray = [Any]()
    public var responseString = String()
    public var responseDictionary = [String : Any]()
    public var exceptionModel = MYsExceptionModel(error: "")
    public var responseModel = MYsFrameWorkResponseModel()
    public var issuccess = false
    public var isResponseDataEmpty:Bool{get{return responseData == nil ? true : false}}
    public var isResponseArrayEmpty:Bool{get{return responseArray.count == 0 ? true : false}}
    public var isResponseDicEmpty:Bool{get{return responseDictionary.keys.count == 0 ? true : false}}
    public var isResponseStringEmpty:Bool{get{return responseString.isEmpty ? true : false}}
    
    func get(completion:(() -> Swift.Void)?){
    }
    func post(completion:(() -> Swift.Void)?){
    }
    func put(completion:(() -> Swift.Void)? ){
    }
    func delete(completion:(() -> Swift.Void)?){
    }
    func deleteAll(completion:(() -> Swift.Void)?){
    }
 
}

public protocol ModelServiceProtocol {
    
}
