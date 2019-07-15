//
//  MYsAppManagerObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 6/20/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

public class MYsAppManagerObject: NSObject {
    
    static public func bundleIdentifier()-> String{
        return Bundle.main.bundleIdentifier!
    }
    
    static public func bundleShortVersionString()-> String{
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    static public func appVersionString()-> String{
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    static public func bundleVersion()-> String{
        return Bundle.main.infoDictionary?["CFBundleVersion"] as! String
    }
    
    
    static public func bundleName()-> String{
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
    }
    
    
    @available(iOS 10.3, *)
    static public func changeAppIcon(name: String?) {
        
        guard UIApplication.shared.supportsAlternateIcons else {
            return
        }
        
        guard let name = name else {
            // Reset to default
            UIApplication.shared.setAlternateIconName(nil)
            return
        }
        
        UIApplication.shared.setAlternateIconName(name){ error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    public static func osVersion()-> Int{
        let os = ProcessInfo().operatingSystemVersion
        var version = 7
        switch (os.majorVersion, os.minorVersion, os.patchVersion) {
        case (8, _, _):
            version = 8
        default:
            version = os.majorVersion
            print("iOS >= \(os.majorVersion).0.0")
        }
        return version
    }
    
    
    public static func setDirectionView(isrtl:Bool){
        if !isrtl{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            MYsUtilities.setUserDefault(data: false, key: "isRTL")
        }else{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            MYsUtilities.setUserDefault(data: true, key: "isRTL")
        }
    }
    
    public static func isRTL()->Bool{
        if let isRtl = MYsUtilities.getUserDefault(key: "isRTL")as? Bool{
            if !isRtl{
                MYsUtilities.setUserDefault(data: false, key: "isRTL")
                return false
            }else{
                MYsUtilities.setUserDefault(data: true, key: "isRTL")
                return true
            }
        }
        setDirectionView(isrtl: false)
        return false
    }
    
}
