//
//  MYsServicesObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 6/20/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit
import LocalAuthentication

public class MYsServicesObject: NSObject {
    var cont = LAContext()
    static public func SendRequest(url:String,parameters:[String:Any]?,headers:[String:String]?,method:String,complition:@escaping(URLResponse?,Data?,Error?)->Void){
        let url = URL(string: url)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpBody = parameters?.jsonData()
        
        if headers != nil {
            for item in headers! {
                urlRequest.setValue(item.key, forHTTPHeaderField: item.value)
            }
        }
        
        urlRequest.httpMethod = method
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else { return }
            let str = String(data: data, encoding: String.Encoding.utf8)
            print(str ?? "")
            DispatchQueue.main.async {
                complition(response,data,error)
            }
            
        }
//        DispatchQueue.global(qos: .userInitiated).async {
//            DispatchQueue.main.async {
//                
//            }
//        }
        task.resume()
    }
}
