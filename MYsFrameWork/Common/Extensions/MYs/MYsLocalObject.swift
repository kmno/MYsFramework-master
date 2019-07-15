//
//  MYsLocalObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 6/20/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsLocalObject: NSObject {

}

public extension NSLocale {
    
    public struct Locale {
        public let countryCode: String
        public let countryName: String
    }
    
    static func locales() -> [Locale] {
        var locales = [Locale]()
        for localeCode in NSLocale.isoCountryCodes {
            let countryName = NSLocale(localeIdentifier: "en_US").displayName(forKey: NSLocale.Key.identifier, value: localeCode)
            //            systemLocale().displayNameForKey(NSLocaleCountryCode, value: localeCode)!
            let countryCode = localeCode
            let locale = Locale(countryCode: countryCode, countryName: countryName!)
            locales.append(locale)
        }
        
        return locales
    }
    
}
