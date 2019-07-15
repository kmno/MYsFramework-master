//
//  MYsDevicesObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 6/20/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import Foundation
import UIKit

class MYsDevicesObject: NSObject {
    
}
extension UIDevice {
    
    static public func isOldDevices()->Bool{
        var flag = false
        switch UIDevice().type {
        case enumDeviceType.iPhone4 , enumDeviceType.iPhone5 , enumDeviceType.iPhone5C ,enumDeviceType.iPhone6,enumDeviceType.iPhone6plus,enumDeviceType.iPadMini1, enumDeviceType.iPadMini2, enumDeviceType.iPadMini3 :
            flag = true
        default:
            flag = false
        }
        return flag
    }
    
    public var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    static public  var IsIPhone4 : Bool{
        return UIDevice().screenType == UIDevice.ScreenType.iPhone4
    }
    
    static public  var IsIPhone5 : Bool{
        return UIDevice().screenType == UIDevice.ScreenType.iPhone5
    }
    
    static public  var IsIPhone6 : Bool{
        return UIDevice().screenType == UIDevice.ScreenType.iPhone6
    }
    
    static public  var IsIPhoneX : Bool{
        return UIDevice().screenType == UIDevice.ScreenType.iPhoneX
    }
    
    static public  var IsIPhoneXR : Bool{
        return UIDevice().screenType == UIDevice.ScreenType.iPhoneXR
    }
    
    static public  var IsIPhoneXMax : Bool{
        return UIDevice().screenType == UIDevice.ScreenType.iPhoneXR
    }
    
    static public  var IsIPhonePlus : Bool{
        return UIDevice().screenType == UIDevice.ScreenType.iPhonePlus
    }
    
    static public  var IsIPad : Bool{
        return UIDevice().userInterfaceIdiom == .pad
    }
    static public var IPadPro : Bool{
        return UIDevice().screenType == UIDevice.ScreenType.iPadPro
    }
    
    static public  var IsSmallIPhones : Bool{
        return UIDevice.IsIPhone5 || UIDevice.IsIPhone4
    }
    
    static public  var IsNormalIPhones : Bool{
        return UIDevice.IsIPhone6 || UIDevice.IsIPhoneX
    }
    
    static public  var IsPlusIPhones : Bool{
        return UIDevice.IsIPhonePlus || UIDevice.IsIPhoneXR
    }
    
    static public  var IsXIPhones : Bool{
        return UIDevice.IsIPhoneX || UIDevice.IsIPhoneXR || UIDevice.IsIPhoneXMax
    }
    
    public var isSimulator: Bool {
        #if IOS_SIMULATOR
        return true
        #else
        return false
        #endif
    }
    
    public static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
    
    public enum ScreenType: String {
        case iPhone
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhoneX
        case iPhoneXR
        case iPhonePlus
        case iPhoneXsMax
        case iPad
        case iPad2
        case iPadPro
        case Unknown
    }
    public var screenType: ScreenType {
        
        switch UIScreen.main.bounds.height {
        case 480:
            return .iPhone4
        case 568,1136:
            return .iPhone5
        case 667,1334:
            return .iPhone6
        case 812,2436:
            return .iPhoneX
        case 736,1920,2208:
            return .iPhonePlus
        case 896,1792:
            return .iPhoneXR
        case 2688 :
            return .iPhoneXsMax
        case  1024 :
            return .iPad
        case 1366:
            return .iPadPro
        default:
            return .iPad
        }
    }
    
    public func battryLevel()->Float{
        return UIDevice.current.batteryLevel
    }
    
    public func battryState()->UIDevice.BatteryState{
        return UIDevice.current.batteryState
    }
    
    public func deviceId() -> String{
        return UIDevice.current.identifierForVendor!.uuidString.replacingOccurrences(of: "-", with: "")
    }
}

public extension UIDevice {
    var modelName: String {
        //#if (arch(i386) || arch(x86_64)) && os(iOS)
        #if targetEnvironment(simulator)
        let DEVICE_IS_SIMULATOR = true
        #else
        let DEVICE_IS_SIMULATOR = false
        #endif
        
        var machineString = String()
        
        if DEVICE_IS_SIMULATOR == true
        {
            if let dir = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
                machineString = dir
            }
        }
        else {
            var systemInfo = utsname()
            uname(&systemInfo)
            let machineMirror = Mirror(reflecting: systemInfo.machine)
            machineString = machineMirror.children.reduce("") { identifier, element in
                guard let value = element.value as? Int8 , value != 0 else { return identifier }
                return identifier + String(UnicodeScalar(UInt8(value)))
            }
        }
        switch machineString {
        case "iPod4,1":                                 return "iPod Touch 4G"
        case "iPod5,1":                                 return "iPod Touch 5G"
        case "iPod7,1":                                 return "iPod Touch 6G"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone 9,4":                 return "iPhone 7 Plus"
        case "iPhone10,1":                              return "iPhone 8"
        case "iPhone10,2":                              return "iPhone 8 Plus"
        case "iPhone10,3":                              return "iPhone X"
        case "iPhone11,2":                              return "iPhone Xs"
        case "iPhone11,4":                              return "iPhone Xs Max"
        case "iPhone11,8":                              return "iPhone XR"
            
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro (9.7 inch)"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro (12.9 inch)"
        case "AppleTV5,3":                              return "Apple TV"
        default:                                        return machineString
        }
    }
}






// #-#-#-#-#-#-#-#-#-#-#-#-#-#-#
//MARK: UIDevice extensions
// #-#-#-#-#-#-#-#-#-#-#-#-#-#-#

public extension UIDevice {
    var type: enumDeviceType {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)
                
            }
        }
        var modelMap : [ String : enumDeviceType ] = [
            "i386"      : .simulator,
            "x86_64"    : .simulator,
            "iPod1,1"   : .iPod1,
            "iPod2,1"   : .iPod2,
            "iPod3,1"   : .iPod3,
            "iPod4,1"   : .iPod4,
            "iPod5,1"   : .iPod5,
            "iPad2,1"   : .iPad2,
            "iPad2,2"   : .iPad2,
            "iPad2,3"   : .iPad2,
            "iPad2,4"   : .iPad2,
            "iPad2,5"   : .iPadMini1,
            "iPad2,6"   : .iPadMini1,
            "iPad2,7"   : .iPadMini1,
            "iPhone3,1" : .iPhone4,
            "iPhone3,2" : .iPhone4,
            "iPhone3,3" : .iPhone4,
            "iPhone4,1" : .iPhone4S,
            "iPhone5,1" : .iPhone5,
            "iPhone5,2" : .iPhone5,
            "iPhone5,3" : .iPhone5C,
            "iPhone5,4" : .iPhone5C,
            "iPad3,1"   : .iPad3,
            "iPad3,2"   : .iPad3,
            "iPad3,3"   : .iPad3,
            "iPad3,4"   : .iPad4,
            "iPad3,5"   : .iPad4,
            "iPad3,6"   : .iPad4,
            "iPhone6,1" : .iPhone5S,
            "iPhone6,2" : .iPhone5S,
            "iPad4,2"   : .iPadAir1,
            "iPad5,4"   : .iPadAir2,
            "iPad4,4"   : .iPadMini2,
            "iPad4,5"   : .iPadMini2,
            "iPad4,6"   : .iPadMini2,
            "iPad4,7"   : .iPadMini3,
            "iPad4,8"   : .iPadMini3,
            "iPad4,9"   : .iPadMini3,
            "iPad6,3"   : .iPadPro9_7,
            "iPad6,4"   : .iPadPro9_7_cell,
            "iPad6,12"  : .iPad5,
            "iPad6,7"   : .iPadPro12_9,
            "iPad6,8"   : .iPadPro12_9_cell,
            "iPad7,1"   : .iPadPro2_12_9,
            "iPad7,2"   : .iPadPro2_12_9_cell,
            "iPhone7,1" : .iPhone6plus,
            "iPhone7,2" : .iPhone6,
            "iPhone8,1" : .iPhone6S,
            "iPhone8,2" : .iPhone6Splus,
            "iPhone8,4" : .iPhoneSE,
            "iPhone9,1" : .iPhone7,
            "iPhone9,2" : .iPhone7plus,
            "iPhone9,3" : .iPhone7,
            "iPhone9,4" : .iPhone7plus,
            "iPhone10,1" : .iPhone8,
            "iPhone10,2" : .iPhone8plus,
            "iPhone10,3" : .iPhoneX,
            "iPhone10,4" : .iPhone8,
            "iPhone10,5" : .iPhone8plus,
            "iPhone10,6" : .iPhoneX
        ]
        
        if let model = modelMap[String.init(validatingUTF8: modelCode!)!] {
            if model == .simulator {
                if let simModelCode = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
                    if let simModel = modelMap[String.init(validatingUTF8: simModelCode)!] {
                        return simModel
                    }
                }
            }
            return model
        }
        return enumDeviceType.unrecognized
    }
}



import AVFoundation
extension AVCaptureDevice {
    var isLocked: Bool {
        do {
            try lockForConfiguration()
            return true
        } catch {
            print(error)
            return false
        }
    }
    func setTorch(intensity: Float) {
        guard hasTorch && isLocked else { return }
        defer { unlockForConfiguration() }
        if intensity > 0 {
            if torchMode == .off {
                torchMode = .on
            }
            do {
                try setTorchModeOn(level: intensity)
            } catch {
                print(error)
            }
        } else {
            torchMode = .off
        }
    }
}
