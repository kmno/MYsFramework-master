//
//  MYsStringObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 6/20/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import Foundation
import UIKit



extension String {

    
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
    
    subscript (bounds: Int) -> String {
        if self.count > 0 {
            let start = index(startIndex, offsetBy: bounds)
            let end = index(startIndex, offsetBy: bounds + 1)
            return String(self[start..<end])
        }
        return self
    }
    
    // MARK: Localizable
    
    public var localized: String {
        if localized(lang: MYsUtilities.Culture()).count > 0{
            return localized(lang: MYsUtilities.Culture())
        }
        return self
    }
    
    public func localized(lang:String) -> String {
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: "", bundle: bundle!, value: "", comment: "")
    }
    
    public func localizedWithComment(_ lang:String , comment:String) -> String {
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: comment)
    }
    
    
    // MARK: String
    
    public var enNumber: String {
        if self.isEmpty && self.count < 1{
            return self
        }
        let item = self.withoutCamma().withoutSpace().replacingOccurrences(of: "/", with: "").replacingOccurrences(of: "\\", with: "").replacingOccurrences(of: ";", with: "").replacingOccurrences(of: ":", with: "").replacingOccurrences(of: "'", with: "").replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "!", with: "").replacingOccurrences(of: "#", with: "").replacingOccurrences(of: "$", with: "").replacingOccurrences(of: "%", with: "").replacingOccurrences(of: "^", with: "").replacingOccurrences(of: "*", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: "_", with: "").replacingOccurrences(of: "-", with: "").replacingOccurrences(of: "+", with: "").replacingOccurrences(of: "=", with: "").replacingOccurrences(of: "`", with: "").replacingOccurrences(of: "~", with: "")
        return containsOnlyLetters(input: item) ? "" : item.encodeToENNumber(false)
    }
    
    func containsOnlyLetters(input: String) -> Bool {
        for chr in input {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") ) {
                return false
            }
        }
        return true
    }
    
    
    
    
    public func htmlToPlainText()-> String
    {
        if self.isEmpty{
            return ""
        }
        let attrStr = try! NSAttributedString(
            data: self.data(using: String.Encoding.utf8, allowLossyConversion: true)!,
            options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue],
            documentAttributes: nil)
        return attrStr.string
    }
    
    public func isNumber() -> Bool {
        return !self.isEmpty && self.rangeOfCharacter(from: NSCharacterSet.decimalDigits.inverted) == nil
    }
    
    public func getFileName() -> String {
        return URL(fileURLWithPath: self).lastPathComponent
    }
    
    func trim() -> String{
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    public func plainString() -> String{
        let someHtmlString = self
        let regex = try! NSRegularExpression(pattern: "<.*?>", options: [.caseInsensitive])
        let range = NSRange(location: 0, length: someHtmlString.count)
        let htmlLessString: String = regex.stringByReplacingMatches(in: someHtmlString, options: NSRegularExpression.MatchingOptions(), range:range, withTemplate: "")
        return htmlLessString
    }
    
    
    //    public func stringFromHTML( string: String?) -> String
    //    {
    //        do{
    //            let str = try NSAttributedString(data:string!.data(using: String.Encoding.utf8, allowLossyConversion: true
    //                )!, options:[NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: NSNumber(unsignedLong: String.Encoding.utf8.rawValue)], documentAttributes: nil)
    //            return str.string
    //        } catch
    //        {
    //            print("html error\n",error)
    //        }
    //        return ""
    //    }
    
    public func userdefaultData() -> AnyObject?{
        return MYsUtilities.getUserDefault(key: self)
    }
    
    public func setUserdefaultData(input :Any?){
        MYsUtilities.setUserDefault(data: input, key: self)
    }
    
    
    // MARK: Date
    
    public func toPersianDate() -> String{
        let date = MYsUtilities.ToPersianCalendar(dateString: self)
        return date
    }

    public func toPersianDateMin() -> String{
        let date = MYsUtilities.ToPersianDateTime(dateString: self).subString(offSet: 0, length: 17)!
        return date
    }
    
    public func toPersianDateTime() -> String{
        let date = MYsUtilities.ToPersianDateTime(dateString: self)
        return date
    }
    
    public func stringToDateTime()->Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy" //Your date format
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
        let date = dateFormatter.date(from: self) //according to date format your date string
        return date
    }
    
    public func toDateTime() -> Date {
        if let date = Date(self){
            return date
        }else{
            let dateFormatter = DateFormatter()
            let dateFormatterEN = DateFormatter()
            dateFormatter.locale = Locale(identifier: "fa_IR")
            dateFormatterEN.dateFormat = "YYYY-MM-dd HH:mm:ssZ"
            dateFormatter.dateFormat = "YYYY/MM/dd - HH:mm:ss"
            let enDate = dateFormatterEN.date(from: self)
            if(enDate != nil){
                return enDate! //dateFormatter.string(from: enDate!)
            }else{
                return Date()
            }
        }
        
    }
    
    public func toDateInt()-> Int{
        if self.toDateTime().toDateInt() > 0{
         return self.toDateTime().toDateInt()
        }
        return 0
    }
    
    
    public func persianDayName()->String{
        var str = ""
        switch self.lowercased() {
        case "saturday":
            str = "شنبه"
        case "sunday":
            str = "یک شنبه"
        case "monday":
            str = "دوشنبه"
        case "tuesday":
            str = "سه شنبه"
        case "wednesday":
            str = "چهارشنبه"
        case "thursday":
            str = "پنج شنبه"
        case "friday":
            str = "جمعه"
        default:
            str = ""
        }
        return str
    }
    
    // MARK: Converter
    
    public func addRial() -> String {
        let str = self.seprateWithCamma() + " " + MYsCaptions().RIAL
        return str
    }
    
    public func ToInt64() -> Int64 {
        let mynum = Int64(self)
        if mynum == nil {
            return 0
        }
        return mynum!
    }
    
    public func ToInt32() -> Int32 {
        let mynum = Int32(self)
        if mynum == nil {
            return 0
        }
        return mynum!
    }
    
    public func ToInt() -> Int {
        let mynum = Int(self)
        if mynum == nil {
            return 0
        }
        return mynum!
    }
    
    public func ToDouble() -> Double {
        let mynum = Double(self)
        if mynum == nil {
            return 0
        }
        return mynum!
    }
    
    public func ToFloat() -> Float {
        let mynum =  Float(self)
        if mynum == nil {
            return 0
        }
        return mynum!
    }
    
    public func ToCGFloat() -> CGFloat {
        if !self.isEmpty{
            let mynum =  CGFloat(self.ToFloat())
            return mynum
        }
        return 0
    }
    
    public func ToBool() -> Bool {
        let mynum =  Bool(self)
        if mynum == true || self == "1" {
            return true
        }
        return false
    }
    
    
    
    public func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
    public func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    public func reverse() -> String {
        let string = self
        let characters = string
        let reversedCharacters = characters.reversed()
        let reversedString = String(reversedCharacters)
        return reversedString
    }
    
    public func encodeToENNumber(_ isDouble:Bool?)->String{
        if self.isEmpty || self.contains(" ") || self.contains("\t") || self.count  < 1 || containsOnlyLetters(input: self){
            return ""
        }
        let numberStr: String = self.withoutSpace()
        let formatter: NumberFormatter = NumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "EN") as Locale
        if let final = formatter.number(from: numberStr){
            var num = (isDouble != nil && isDouble!) ? String(final.doubleValue) : final.int64Value.ToString()
            let length = self.withoutCamma().count - num.count
            if length > 0 {
                for _ in 0 ... length - 1 {
                    num = "0\(num)"
                }
            }
            return num
        }
        return ""
    }
    
    public func toDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    public func toArray() -> [Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    var parseJSONString: Any {
        
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: true)
        
        if let jsonData = data {
            // Will return an object or nil if JSON decoding fails
            return try! JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers)
        } else {
            // Lossless conversion of the string was not possible
            return ""
        }
    }
    
    
    public func toImage() -> UIImage? {
        
        if (self.count < 5) {
            return nil
        }
        do {
            // !!! Separation part is optional, depends on your Base64String !!!
            let temp = self.contains("data:image/png;base64,") ? self.components(separatedBy: ",") : ("data:image/png;base64," + self).components(separatedBy: ",")
            let dataDecoded : Data = Data(base64Encoded: temp[1], options: .ignoreUnknownCharacters)!
            let decodedimage = UIImage(data: dataDecoded)
            return decodedimage!
        }catch {
            return nil
        }
    }
    
    
    // MARK: Replacing
    
    public func withoutSpace() -> String{
        
        if !self.isEmpty && self.count > 0 {
            return  self.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: " ", with: "")
        }
        return ""
    }
    
    public func withoutCamma() -> String{
        
        if !self.isEmpty && self.count > 0 {
            return  self.withoutSpace().replacingOccurrences(of: ",", with: "").replacingOccurrences(of: "،", with: "").replacingOccurrences(of: " ", with: "")
            
        }
        return ""
    }
    
    public func withoutDash() -> String{
        
        if !self.isEmpty && self.count > 0 {
            return  self.withoutSpace().replacingOccurrences(of: "-", with: "").replacingOccurrences(of: "-", with: "").replacingOccurrences(of: " ", with: "")
            
        }
        return ""
    }
    
    public func seprateWithCamma()-> String{
        if self.count > 3{
            let str = self.ToInt().stringFormatedWithCamma
            return str
        }
        return self
    }
    
    public func stringFormatedWithSepator()-> String{
        let str = self.ToInt().stringFormatedWithSepator
        return str
    }
    
    public func SecureCard()->String{
        if !self.isEmpty && self.count > 15 {
            return MYsCardManagements.getSecureCard(cardNumber: self)
        }
        return ""
    }
    public func maskPan()->String{
        if !self.isEmpty && self.count > 15 {
            return MYsCardManagements.getMaskCard(cardNumber: self)
        }
        return ""
    }
    
    public func getBillAmount()-> String{
        if self.count == 13 {
            return (self.subString(offSet: 0, length: 8)!.ToInt() * 1000).ToString()
        }else if self.count == 26 {
            let strpaymentId = self.subString(offSet: 13, length: 13)!
            return (strpaymentId.subString(offSet: 0, length: 8)!.ToInt() * 1000).ToString()
        }else if self.count < 13{
            let amount = self.getFullyBillORPayID().subString(offSet: 0, length: 8)!
           return  (amount.ToInt() * 1000).ToString()
        }
        return ""
    }
    
    public func getFullyBillORPayID()->String{
        var strId = self
        if self.count < 13 {
            for _ in 0 ..< (13 - self.count){
                strId = "0\(strId)"
            }
        }
        return strId
    }
    
    public func getBillType()->enumBillType{
        var type = enumBillType.None
        var billType = 0
        if self.count == 13 {
            billType = self[11].description.ToInt()
        }else if self.count == 26 {
            billType = self.subString(offSet: 13, length: 13)![11].ToInt()
        }else{
            billType = self.getFullyBillORPayID()[11].ToInt()
        }
        switch(billType) {
        case 1:
            type = enumBillType.Water
        case 2:
            type = enumBillType.Electricity
        case 3:
            type = enumBillType.Gas
        case 4:
            type = enumBillType.Phone
        case 5:
            type = enumBillType.Mobile
        case 6:
            type = enumBillType.Municipality
        case 9:
            type = enumBillType.Penalty
        default:
            type = enumBillType.None
        }
        return type
    }
    
    public func SeprateForCreditCard()->String{
        var number  = self
//        if number.withoutSpace().enNumber.count > 0 {
//            number = number.withoutSpace().enNumber
//        }
        
        if number.count > 4{
            number.insert(" ", at: number.index(number.startIndex, offsetBy: 4))
        }
        if number.count > 9{
            number.insert(" ", at: number.index(number.startIndex, offsetBy: 9))
        }
        if number.count > 14{
            number.insert(" ", at: number.index(number.startIndex, offsetBy: 14))
        }
        if number.count > 19{
            number.insert(" ", at: number.index(number.startIndex, offsetBy: 19))
        }
        
        return number
    }

    
    public func SeprateWithDashCreditCard()->String{
        var number  = self
        //        if number.withoutSpace().enNumber.count > 0 {
        //            number = number.withoutSpace().enNumber
        //        }
        
        if number.count > 4{
            number.insert("-", at: number.index(number.startIndex, offsetBy: 4))
        }
        if number.count > 9{
            number.insert("-", at: number.index(number.startIndex, offsetBy: 9))
        }
        if number.count > 14{
            number.insert("-", at: number.index(number.startIndex, offsetBy: 14))
        }
        if number.count > 19{
            number.insert("-", at: number.index(number.startIndex, offsetBy: 19))
        }
        
        return number
    }

    
    
    public func subString(offSet:Int , length:Int) -> String? {
        if self.count != 0 && self.count >= offSet + length{
            let name = self
            
            // Get range based on the string index.
            let startIndex = name.index(name.startIndex, offsetBy: offSet)
            let lastIndex = name.index(startIndex, offsetBy: length)
            
            // Access substring from range.
            let result = name[startIndex..<lastIndex].description
            return result
        }
        return self
    }
    
    public func subString(offSet:Int , length:Int,hasZero:Bool) -> String? {
        if self.count >= offSet + length{
            let name = self
            
            // Get range based on the string index.
            let startIndex = name.index(name.startIndex, offsetBy: offSet)
            let lastIndex = name.index(startIndex, offsetBy: length)
            
            // Access substring from range.
            var result = name[startIndex..<lastIndex].description
            result = !hasZero && result == "0" ? "" : result
            return result
        }
        return !hasZero && self == "0" ? "" : self 
    }
    
    mutating public func insertString(char:Character,index:Int)->String {
        var str = self
        if str.count > index {
            str.insert(char, at: String.Index.init(encodedOffset: index))
        }
        return str
    }
    
    // MARK : Validator
    
//    public func isValidEmail() -> Bool {
//        // print("validate calendar: \(testStr)")
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//        
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailTest.evaluate(with: self)
//    }
    
    public func isValidMobile() -> Bool{
        if self.range(of: "^\\+?0*(?:98)?9\\d{9,9}$", options: .regularExpression) != nil {
            print("\(self) is probably a valid mobile number")
            return true
        }else{
            return false
        }
    }
    
    public func isValidPassword() -> Bool{
        if self.range(of: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$", options: .regularExpression) != nil {
            print("\(self) is probably a valid mobile number")
            return true
        }else{
            return false
        }
    }
    
    public func isValidIranianMobile() -> Bool{

        if self.range(of: "09(0[1,2,3,5]|1[0-9]|3[0-9]|2[0-2]|9[0,1,4,8,9])-?[0-9]{3}-?[0-9]{4}", options: .regularExpression) != nil || self.range(of: "989(0[1,2,3,5]|1[0-9]|3[0-9]|2[0-2]|9[0,1,4,8,9])-?[0-9]{3}-?[0-9]{4}", options: .regularExpression) != nil {
            print("\(self) is probably a valid mobile number")
            return true
        }else{
            return false
        }
    }
    
    public func isValidIranianPostalCode() -> Bool{
        if self.range(of: "[0-9]{10}", options: .regularExpression) != nil {
            print("\(self) is probably a valid Postal Code")
            return true
        }else{
            return false
        }
    }
    
    public func isValidIranianPhoneNumber() -> Bool{
        if(self.count < 10){
            return false
        }
        
        if(self.charactersArray[0] != "0"){
            return false
        }
        if self.range(of: "[0-9]{8,11}", options: .regularExpression) != nil {
            print("\(self) is probably a valid phone number")
            return true
        }else{
            return false
        }
    }
    
    public func isValidBillID() -> Bool{
        var str = self
        var mm = 0
        while mm < (13 - self.count) {
            str = "0\(str)"
            mm = mm + 1
        }
        
        if let checkDigit:Int = Int(str.subString(offSet: str.count - 1, length: 1)!){ //str.substring(from: str.index(before: str.endIndex))
            let temp = String(str.dropLast())
            
            var sum:Int = Int(0)
            var mod = Int()
            var i = Int(0)
//            for index in Array(str).reversed(){
//                switch i {
//                case 0:
//                   sum += String(index).ToInt() * 2
//                case 1:
//                    sum += String(index).ToInt() * 3
//                case 2:
//                    sum += String(index).ToInt() * 4
//                case 3:
//                    sum += String(index).ToInt() * 5
//                case 4:
//                    sum += String(index).ToInt() * 6
//                case 5:
//                    sum += String(index).ToInt() * 7
//                case 6:
//                    sum += String(index).ToInt() * 2
//                case 7:
//                    sum += String(index).ToInt() * 3
//                case 8:
//                    sum += String(index).ToInt() * 4
//                case 9:
//                    sum += String(index).ToInt() * 5
//                case 10:
//                    sum += String(index).ToInt() * 6
//                case 11:
//                    sum += String(index).ToInt() * 7
//                case 12:
//                    sum += String(index).ToInt() * 2
//                default:
//                    break
//                }
//            }
            for i in 0 ..< temp.count {
                mod = i % 6
                sum += Int(temp[temp.count - 1 - i])! * (mod + 2)
            }
            var check = (sum % 11)
            check = check > 1 ? 11 - check : check
            check = check == 1 ? 0 : check
            if( check == checkDigit){
                return true
            }else{
                return false
            }
        }else{
            return false
            
            //
            //        if let checkDigit:Int = Int(self.substring(from: self.index(before: self.endIndex))){
            //            let temp = String(self.dropLast())
            //
            //            var sum:Int = Int(0)
            //            var mod = Int()
            //            for i in 0 ..< temp.count {
            //                mod = i % 6
            //                sum += Int(temp[temp.count - 1 - i])! * (mod + 2)
            //            }
            //            let check = 11 - (sum % 11)
            //            if((check % 10) == (checkDigit % 10)){
            //                return true
            //            }else{
            //                return false
            //            }
            //        }else{
            //            return false
            //        }
        }
    }
    
    public func isValidIranianBillBarCode()->Bool{
        if self.count == 26{
            return true
        }
        return false
    }
    
   public  func isValidIranianQRCode()->Bool{
        if self.contains(","){
            let stringArr = self.components(separatedBy: ",")
            if stringArr.count > 0 {
                return true
            }
        }
        return false
    }
    
   public func isValidIranianNationalCode() -> Bool {
//        var digits = self.characters.flatMap { Int(String($0)) }
//        guard digits.count == 10 && digits.count == self.count else {
//            return false
//        }
//        
//        let check = digits[9]
//        let sum = digits[0 ..< 9].enumerated().reduce(0) { $0 + $1.element * (10 - $1.offset) } % 11
//        
        return true // sum < 2 ? check == sum : check + sum == 11
    }
    
    public func setIranianCountryCode()->String{
        return (self as NSString).replacingCharacters(in: NSMakeRange(0, 1) , with: "98") as String
    }
    
    public func unSetIranianCountryCode()->String{
        if self.count > 0 {
            if self[0] == "0" {
                return self
            }
            return (self as NSString).replacingCharacters(in: NSMakeRange(0, 2) , with: "0") as String
        }
        return self
    }

    
    //    public func IsIranianMobileNumber() -> Bool{
    //        if !self.isEmpty && self.count > 0  && self.count < 15{
    //            if self.count ==
    //            return  self.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: " ", with: "")
    //
    //        }
    //        return ""
    //    }
    
    
    
    // MARK : Size
    
    public func getHeight(width:CGFloat,font:UIFont) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = self
        label.sizeToFit()
        
        return label.frame.height
    }

    public func getHeight(width:CGFloat,fontSize:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = UIFont(size: fontSize)
        label.text = self
        label.sizeToFit()
        
        return label.frame.height
    }

}

