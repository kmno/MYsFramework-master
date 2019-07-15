//
//  MYsCardModel.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 1/17/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

public class MYsBankCardModel: NSObject {
    public var id = ""
    public var title = ""
    public var pan = ""
    public var cvv2 = ""
    public var logoName = ""
    public var bankName = ""
    public var ownerName = ""
    public var expireDate = ""
    public var logoImage = UIImage()
    
    public var backgoundColor = UIColor()
    public var panColor = UIColor.lightGray
    public var bankColor = UIColor.lightGray
    public var backgoundColors = [UIColor]()
    public var ownerColor = UIColor.lightGray
    public var logoBackkColor = UIColor.lightGray
    public var CardShadowColor = UIColor.lightGray
    
    
}
