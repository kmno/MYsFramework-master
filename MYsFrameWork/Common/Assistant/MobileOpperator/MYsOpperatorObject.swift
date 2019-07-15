//
//  MYsOpperatorObject.swift
//  MYsFrameWork
//
//  Created by Mahdi Yousefpour on 6/26/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import Foundation

public class MYsOpperatorObject{
    
    static public func getOpperatorBy(number:String)-> String{
        let arrHamrahAvalPreCode = ["910","911","912","913","914","915","916","917","918","919","990"]
        let arrIrancelAvalPreCode = ["901","902","930","933","935","936","937","938","939","941"]
        let arrRightelPreCode = ["920","921","922"]
        if arrHamrahAvalPreCode.contains(number.ToInt().ToString().subString(offSet: 0, length: 3)!) {
            return enumOpperators.HamrahAval.simpaleDiscription().localized
        }else if arrIrancelAvalPreCode.contains(number.ToInt().ToString().subString(offSet: 0, length: 3)!) {
            return enumOpperators.Irancell.simpaleDiscription().localized
        }else if arrRightelPreCode.contains(number.ToInt().ToString().subString(offSet: 0, length: 3)!) {
            return enumOpperators.Rightel.simpaleDiscription().localized
        }
        return enumOpperators.None.simpaleDiscription()
    }
    
    static public func getEnumOpperatorBy(number:String)-> enumOpperators{
        let arrHamrahAvalPreCode = ["910","911","912","913","914","915","916","917","918","919","990"]
        let arrIrancelAvalPreCode = ["901","902","930","933","935","936","937","938","939","941"]
        let arrRightelPreCode = ["920","921","922"]
        
        if arrHamrahAvalPreCode.contains(number.ToInt().ToString().subString(offSet: 0, length: 3)!) {
            return enumOpperators.HamrahAval
        }else if arrIrancelAvalPreCode.contains(number.ToInt().ToString().subString(offSet: 0, length: 3)!) {
            return enumOpperators.Irancell
        }else if arrRightelPreCode.contains(number.ToInt().ToString().subString(offSet: 0, length: 3)!) {
            return enumOpperators.Rightel
        }
        return enumOpperators.None
    }
    
    
}
