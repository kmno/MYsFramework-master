//
//  MYsPaymentObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 7/4/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsPaymentObject: NSObject {
    var Amount : Float = 0
    var Title : String = ""
    var Description : String = ""
    var CardacceptorTerminalID: String = ""
    var CardacceptorID: String = ""
    var SendSms : Bool = false
    var MobileNumber : String = ""
    var PAN : String = ""
    var PIN2 : String = ""
    var CVV2 : String = ""
    var ExpireDate : String = ""
}
