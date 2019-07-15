//
//  MYsUtilities.swift
//  MYsFramework
//
//  Created by Mahdi Yousefpour on 4/30/17.
//  Copyright © 2017 Mahdi Yousefpour. All rights reserved.
//

import UIKit
import Foundation
import CoreTelephony
import AudioToolbox
import AVFoundation


open class MYsUtilities: NSObject{

    static public var language = ""
    static public func setCulture(culture : String){
        setUserDefault(data: culture, key: "Language")
    }
    static public func Culture() -> String{
        if let culture = getUserDefault(key: "Language") as? String {
            return culture
        }
        setUserDefault(data: "fa-IR", key: "Language")
        let culture  = getUserDefault(key: "Language")
        return culture as! String
    }
    
    
    
    // MARK: // Navigation
    static public func ApearanceNavigation(istranslucent:Bool, navBarTint:UIColor,navTint:UIColor,navText:UIColor, tabBarBackgorund:UIColor,tabBar:UIColor,tabBarText:UIColor, tabBarHighlite:UIColor, font:UIFont){
        
        let attributes: [NSAttributedString.Key: AnyObject] = [NSAttributedString.Key.font:UIFont.fontWithSize(size: 8),NSAttributedString.Key.foregroundColor: tabBarText]
        
        let selectedattributes: [NSAttributedString.Key: AnyObject] = [NSAttributedString.Key.font:UIFont.fontWithSize(size: 8),NSAttributedString.Key.foregroundColor: tabBarHighlite]
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        UITabBar.appearance().tintColor  = tabBarHighlite
        UITabBar.appearance().barTintColor  = tabBar
        UITabBar.appearance().backgroundColor  = tabBarBackgorund
        
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(selectedattributes, for: .selected)
        
        
        UINavigationBar.appearance().tintColor = navTint
        UINavigationBar.appearance().barTintColor = navBarTint
        UINavigationBar.appearance().isTranslucent = istranslucent
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:navText,NSAttributedString.Key.font:UIFont.defaultFont()]
    }
    
    static public func ApearanceNavigation(_ viewControll:UIViewController,istranslucent:Bool,barTintColor:UIColor,navTintColor:UIColor,tabtintColor:UIColor,tabitemColor:UIColor,tabcaptionColor:UIColor,tabBarHighlite:UIColor,font:UIFont){
        let attributes: [NSAttributedString.Key: AnyObject] = [NSAttributedString.Key.font:UIFont.fontWithSize(size: 8),NSAttributedString.Key.foregroundColor: tabcaptionColor]
        let selectedattributes: [NSAttributedString.Key: AnyObject] = [NSAttributedString.Key.font:UIFont.fontWithSize(size: 8),NSAttributedString.Key.foregroundColor: tabBarHighlite]
        
        let appearance = UITabBarItem.appearance()
        UITabBar.appearance().tintColor  = tabitemColor
        UITabBar.appearance().backgroundColor  = tabtintColor
        UITabBar.appearance().barTintColor  = tabtintColor
        appearance.setTitleTextAttributes(attributes, for: .normal)
        appearance.setTitleTextAttributes(selectedattributes, for: .selected)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        UINavigationBar.appearance().tintColor = navTintColor
        UINavigationBar.appearance().barTintColor = barTintColor
        UINavigationBar.appearance().isTranslucent = istranslucent
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font:UIFont.defaultFont()]
        viewControll.tabBarController?.navigationController?.navigationBar.tintColor = navTintColor
        viewControll.tabBarController?.navigationController?.navigationBar.barTintColor = barTintColor
        
    }
    
    
    // MARK: Show Alert
    
    static public func showMessage(target:UIViewController,model:MYsAlertModel,doneCompletion:(()->Void)?,cancelCompletion:(()->Void)?){
        let titleAttributed = NSMutableAttributedString(string: model.title.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 18)!])
        let messageAttributed = NSMutableAttributedString(string: model.message.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
        
        let alert = UIAlertController(title: model.title.localized, message: model.message.localized, preferredStyle: .alert)
        alert.setValue(titleAttributed, forKey : "attributedTitle")
        alert.setValue(messageAttributed, forKey : "attributedMessage")
        
        
        
        if !model.doneTitle.isEmpty{
            let doneAction = UIAlertAction(title: model.doneTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: model.doneTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
                    // Fallback on earlier versions
                }
                if doneCompletion != nil{
                    doneCompletion!()
                }
            }
            
            alert.addAction(doneAction)
        }
        if !model.cancelTitle.isEmpty{
            alert.addAction(UIAlertAction(title: model.cancelTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: model.cancelTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
                    // Fallback on earlier versions
                }
                if cancelCompletion != nil{
                    cancelCompletion!()
                }
            })
        }
        
        target.present(alert, animated: true)
    }
    
    // MARK: // Generate Random Code
    //////////////////Generate Random Code//////////////////////
    static public func RandomCode(_ max:UInt32) -> Int {
        var diceRoll = 0
        var flag = true
        while flag {
            diceRoll = Int(arc4random_uniform(max))
            if diceRoll > 999 {
                flag = false
            }
        }
        return diceRoll
    }
    
    static public func generateRandomNumber(min: Int, max: Int) -> Int {
        let randomNum = Int(arc4random_uniform(UInt32(max) - UInt32(min)) + UInt32(min))
        return randomNum
    }
    //////////////////Generate Random Code//////////////////////
    
    //    // MARK: // User Defaults
    
    //////////////////User Defaults//////////////////////
    static public func setUserDefault( data: Any? ,key :String)
    {
        let userDefaults = UserDefaults.standard
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: data as Any)
        userDefaults.set(encodedData, forKey: key)
        userDefaults.synchronize()
        
    }
    static public func getUserDefault( key :String)-> AnyObject?
    {
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.object(forKey: key)
        if decoded != nil{
            if let decos = decoded as? NSData{
                let decodeddata = NSKeyedUnarchiver.unarchiveObject(with: decos as Data)
                return decodeddata! as AnyObject?
            }
            if let decos = decoded as? String{
                return decos as AnyObject?
            }
        }
        return nil
    }
    
    static public func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
    //////////////////User Defaults//////////////////////
    
    //////////////////Calendar//////////////////////
    static func ToPersianCalendar(year:Int , month:Int , day:Int) -> String {
        
        let dateString = "\(month)-\(day)-\(year)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        //        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        let dateObj = dateFormatter.date(from: dateString)
        
        let date = dateObj
        
        let calender = NSCalendar(calendarIdentifier: NSCalendar.Identifier.persian)
        let components = calender?.components(NSCalendar.Unit(rawValue: UInt.max), from: date!)
        
        let year =  components!.year
        let month = components!.month
        let day = components!.day
        
        return "\(year!)/\(month!)/\(day!)"
    }
    
    static func ToPersianCalendar(dateString:String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        var dateObj = dateFormatter.date(from: dateString)
        
        if dateObj == nil {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            dateObj = dateFormatter.date(from: dateString)
        }
        if dateObj == nil {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            dateObj = dateFormatter.date(from: dateString)
        }
        if dateObj == nil {
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ssZ"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            dateObj = dateFormatter.date(from: dateString)
        }
        if dateObj == nil {
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "YYYY/MM/dd - HH:mm:ss"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            dateObj = dateFormatter.date(from: dateString)
        }
        if dateObj == nil {
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "YYYY/MM/dd"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            dateObj = dateFormatter.date(from: dateString)
        }
        if dateObj == nil {
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "YYYY/M/dd"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            dateObj = dateFormatter.date(from: dateString)
        }
        
        
        if dateObj != nil{
            let date = dateObj
            let calender = NSCalendar(calendarIdentifier: NSCalendar.Identifier.persian)
            let components = calender!.components(NSCalendar.Unit(rawValue: UInt.max), from: date!)
            
            let year =  components.year!
            let month = components.month!
            let day = components.day!
            
            var hour = components.hour!
            var min = components.minute!
            var sec = components.second!
            
            let tmonth = month < 10 ? "0\(month)" : month.ToString()
            let tday = day < 10 ? "0\(day)" : day.ToString()
            
            hour = hour < 10 ? "0\(hour)".ToInt() : hour
            min = min < 10 ? "0\(min)".ToInt() : min
            sec = sec < 10 ? "0\(sec)".ToInt() : sec
            
            return "\(year)/\(tmonth)/\(tday)"
        }
        return ""
    }
    
    
    static func ToPersianDateTime(dateString:String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        var dateObj = dateFormatter.date(from: dateString)
        
        if dateObj == nil {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            dateObj = dateFormatter.date(from: dateString)
        }
        if dateObj == nil {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            dateObj = dateFormatter.date(from: dateString)
        }
        if dateObj == nil {
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ssZ"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            dateObj = dateFormatter.date(from: dateString)
        }
        if dateObj == nil {
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "YYYY/MM/dd - HH:mm:ss"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            dateObj = dateFormatter.date(from: dateString)
        }
        
        
        if dateObj != nil{
            let date = dateObj
            let calender = NSCalendar(calendarIdentifier: NSCalendar.Identifier.persian)
            let components = calender!.components(NSCalendar.Unit(rawValue: UInt.max), from: date!)
            
            let year =  components.year!
            let month = components.month!
            let day = components.day!
            
            let hour = components.hour!
            let min = components.minute!
            let sec = components.second!
            
            let tmonth = month < 10 ? "0\(month)" : month.ToString()
            let tday = day < 10 ? "0\(day)" : day.ToString()
            
            let thour = hour < 10 ? "0\(hour)" : hour.ToString()
            let tmin = min < 10 ? "0\(min)" : min.ToString()
            let tsec = sec < 10 ? "0\(sec)" : sec.ToString()
            
            return "\(year)/\(tmonth)/\(tday)  \(thour):\(tmin):\(tsec)"
        }
        return ""
    }
    
    static func ToPersianDate(date : NSDate) -> String {
        
        let calender = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let components = calender?.components(NSCalendar.Unit(rawValue: UInt.max), from: date as Date)
        
        let year =  components!.year!
        let month = components!.month!
        let day = components!.day!
        
        
        
        return MYsUtilities.ToPersianCalendar(dateString: "\(month)-\(day)-\(year)")
    }
    
    //MARK : Date Time
    
    
    
    static func ToDateTime(_ year:Int , month:Int , day:Int) -> Date {
        
        let dateString = "\(month)-\(day)-\(year)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        //        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        let dateObj = dateFormatter.date(from: dateString)
        return (dateObj! as NSDate) as Date
    }
    
    //    static func ToDateString(_ date : Date) -> String {
    //
    //        let calender = Calendar(identifier: Calendar.Identifier.gregorian)
    //        let components = calender.components(Calendar.init(identifier: .max), from: date as Date)
    //
    //        let year =  components!.year
    //        let month = components!.month
    //        let day = components!.day
    //
    //        return "\(month)-\(day)-\(year)"
    //    }
    //
    //    static func ToDateString(_ year:Int , month:Int , day:Int) -> String {
    //
    //        let dateString = "\(month)-\(day)-\(year)"
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.dateFormat = "MM-dd-yyyy"
    ////        dateFormatter.dateStyle = DateFormatter.Style.MediumStyle
    //        let dateObj = dateFormatter.date(from: dateString)
    //
    //        let date = dateObj
    //
    //        let calender = Calendar(identifier: Calendar.Identifier.gregorian)
    //        let components = calender.components(Calendar.init(identifier: UInt.max), from: date!)
    //
    //        let year =  components!.year
    //        let month = components!.month
    //        let day = components!.day
    //
    //        return "\(month)-\(day)-\(year)"
    //    }
    //////////////////Calendar//////////////////////
    
    //////////////////Sound//////////////////////
    static public func PlaySoundToChange(){
//        if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
//            AudioServicesPlaySystemSound(1520)
//        }else{
//            AudioServicesPlaySystemSound(1104)
//        }
    }
    //////////////////Sound//////////////////////
    
    
    //////////////////Open URL//////////////////////
    
    static public func openSettings() {
        let url = URL(string: UIApplication.openSettingsURLString)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    static public func openUrl(_ url:String) {
        if !url.isEmpty{
            let url = URL(string: url)
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url!)
            }
            
        }
    }
    
    static public func callMobile(_ phone:String) {
        if let url = URL(string: "tel://\(phone)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }else{
            
        }
    }
    
    
    static public func sharedTextToOther(viewController:UIViewController,text:String){
        // text to share        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = viewController.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        // present the view controller
        viewController.present(activityViewController, animated: true, completion: nil)
        
        
    }
    
    static public func sharedImageToOther(viewController:UIViewController,image:UIImage) {
        
        // image to share
        
        // set up activity view controller
        let imageToShare = [ image ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = viewController.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        // present the view controller
        viewController.present(activityViewController, animated: true, completion: nil)
    }
    
    //////////////////Open URL//////////////////////
    
    //////////////////UDID//////////////////////
    static public func UDID() -> String {
        let Identifier: String = (UIDevice.current.identifierForVendor!.uuidString)
        return Identifier
    }
    
    static public func UUID() -> String
    {
        let uuid = Foundation.UUID().uuidString
        return uuid
    }
    
    
    //////////////////UDID//////////////////////
    
    
    static public func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    static public var player: AVAudioPlayer?
    static public func playSound(name:String,exten:String) {
        
        guard let url = Bundle.main.url(forResource: name, withExtension: exten) else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback,mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    static public func playSoundWhenTaped(){
        if UIDevice.isOldDevices(){
            AudioServicesPlaySystemSound(SystemSoundID(1104))
        }else{
            let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
            feedbackGenerator.impactOccurred()
        }
    }
    
    static public func autoNumber() -> String{
        var number = "1"
        if let num = MYsUtilities.getUserDefault(key: "autoNumber") as? String{
            number = num
            number = (number.ToInt64() + 1).ToString()
            MYsUtilities.setUserDefault(data: number, key: "autoNumber")
            return number
        }
        number = number.ToInt64().ToString()
        MYsUtilities.setUserDefault(data: number, key: "autoNumber")
        return number.ToInt64().ToString()
    }
    
    static public func checkDeviceAndGetResult(iphone4:Int,iphone5:Int,iphone6:Int,iphoneX:Int,iphonePlus:Int,ipadmini:Int, ipadair:Int,ipadpro:Int)->Int{
        if UIDevice.IsIPhone4 {
            return iphone4
        }else if UIDevice.IsIPhone5 {
            return iphone5
        }else if UIDevice.IsIPhone6 {
            return iphone6
        }else if UIDevice.IsIPhoneX {
            return iphoneX
        }else if UIDevice.IsIPhonePlus {
            return iphonePlus
        }else if UIDevice.IsIPad {
            return ipadpro
        }
        return 0
    }
    
    static public func checkDeviceAndGetResult(small:CGFloat,medium:CGFloat,large:CGFloat,ipad:CGFloat)->CGFloat{
        if UIDevice.IsIPhone4  || UIDevice.IsIPhone5{
            return small
        }else if UIDevice.IsIPhone6 || UIDevice.IsIPhoneX {
            return medium
        }else if UIDevice.IsIPhonePlus || UIDevice.IsIPhoneXR {
            return large
        }else if UIDevice.IsIPad {
            return ipad
        }
        return 0
    }
    
    static public func checkDeviceAndGetResult(verysmall:CGFloat,small:CGFloat,medium:CGFloat,large:CGFloat,ipad:CGFloat)->CGFloat{
        if UIDevice.IsIPhone4  || UIDevice.IsIPhone5{
            return verysmall
        }else if UIDevice.IsIPhone6 {
            return small
        }else if UIDevice.IsIPhoneX {
            return medium
        }else if UIDevice.IsIPhonePlus || UIDevice.IsIPhoneXR {
            return large
        }else if UIDevice.IsIPad {
            return ipad
        }
        return 0
    }
    
    
    public static func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    
    
    public func clipBoard(value:String){
        UIPasteboard.general.string = value
    }

}
