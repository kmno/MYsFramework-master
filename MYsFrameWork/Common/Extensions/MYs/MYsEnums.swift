//
//  MYsEnums.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 6/20/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsEnums: NSObject {

}

public func FanavaCheckResponse(response:String) -> String {
    if ErrorListUser[response] == nil || ErrorListUser[response]!.count < 1  {
        return ""
    }
    else{
        return ErrorListUser[response]!
    }
}// Idont Know


public enum MYsHttpMehtods : String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}// for HTTP MEHTOD 

public enum MYsMapping {
    case DB
    case Dictionary
}// for Mapping from DB or Dictionanry

public enum enumPosition : String{
    case top
    case bottom
    case right
    case left
}

public enum enumTextFieldTypes : String{
    case none
    case mobile
    case card
    case bill
    case tel
    case postalCode
    case password
    case username
    case smallamount
    case longamount
    case smallnumber
    case longnumber
    case otp
}

public enum enumStatus : Int{
    case none = -1
    case success = 0
    case failed = 1
    case pendding = 2
    case warning = 3
    case onProgress = 4
    case caution = 5
    
    public func simpaleDiscription()->String{
        
        switch self {
        case .none:
            return ""
        case .success:
            return "MYS_CAPTION_SUCCESS"
        case .failed:
            return "MYS_CAPTION_FAILED"
        case .pendding:
            return "MYS_CAPTION_PENDDING"
        case .warning:
            return "MYS_CAPTION_WARNING"
        case .onProgress:
            return "MYS_CAPTION_ONPROGRESS"
        default:
            return ""
        }
    }
}// Type Of Actions

public enum enumFileType : Int{
    case none = -1
    case video = 0
    case music = 1
    case pdf = 2
    case word = 3
    case media = 4
    case document = 5
    case excel = 6
    case access = 7
    case powepoint = 8
    case image = 9
    case exe = 10
    
//    public func simpaleDiscription()->String{
//
//        switch self {
//        case .none:
//            return ""
//        case .success:
//            return "MYS_CAPTION_SUCCESS"
//        case .failed:
//            return "MYS_CAPTION_FAILED"
//        case .pendding:
//            return "MYS_CAPTION_PENDDING"
//        case .warning:
//            return "MYS_CAPTION_WARNING"
//        case .onProgress:
//            return "MYS_CAPTION_ONPROGRESS"
//        default:
//            return ""
//        }
//    }
}// Type Of Actions

public enum enumAppServices: Int{
    
    case None
    case Always
    case Charge
    case Internet
    case Charity
    case Bill
    case Other
    
    public func simpaleDiscription()->String{
        
        switch self {
        case .None:
            return ""
        case .Always:
            return "MYS_CAPTION_ALWAYS"
        case .Charge:
            return "MYS_CAPTION_CHARGE"
        case .Internet:
            return "MYS_CAPTION_INTERNET"
        case .Charity:
            return "MYS_CAPTION_CHARITY"
        case .Bill:
            return "MYS_CAPTION_BILL"
        default:
            return ""
        }
        
    }
    
    static public func getAppService(input:String)->enumAppServices{
        
        switch input {
        case "":
            return .None
        case "MYS_CAPTION_ALWAYS":
            return .Always
        case "MYS_CAPTION_CHARGE":
            return .Charge
        case "MYS_CAPTION_INTERNET":
            return .Internet
        case "MYS_CAPTION_CHARITY":
            return .Charity
        case "MYS_CAPTION_BILL":
            return .Bill
        default:
            return .None
        }
        
    }
}

public enum enumOpperators: Int {
    
    case None
    case Irancell
    case HamrahAval
    case Rightel
    case Talia
    case Uptel
    case Other
    
    public func simpaleDiscription()->String{
        
        switch self {
        case .None:
            return ""
        case .Irancell:
            return "MYS_CAPTION_IRANCELL"
        case .HamrahAval:
            return "MYS_CAPTION_HAMRAHAVAL"
        case .Rightel:
            return "MYS_CAPTION_RIGHTEL"
        case .Uptel:
            return "MYS_CAPTION_UPTEL"
        default:
            return ""
        }
        
    }
}// Opperators

public enum enumMobileChargeType : Int {
    
    case None
    case Normal
    case WOWCharge
    case Other
    
    public func getServiceCode()->Int{
        switch self {
        case .None:
            return 0
        case .Normal:
            return 1
        case .WOWCharge:
            return 2
        default:
            return -2
        }
    }
    
    public mutating func getCaption(index:Int)->String{
        switch index {
        case 0:
            self = .Normal
            return "MYS_CAPTION_NORMALCHARGE".localized
        case 1:
            self = .WOWCharge
            return "MYS_CAPTION_WOWCHARGE".localized
        default:
            return ""
        }
    }
    
    public func simpaleDiscription()->String{
        
        switch self {
        case .None:
            return ""
        case .Normal:
            return "MYS_CAPTION_NORMALCHARGE"
        case .WOWCharge:
            return "MYS_CAPTION_WOWCHARGE"
        default:
            return ""
        }
    }
}// Mobile Charge Type


public enum enumInternetServices : Int{
    case None
    case IrancellDaylyInternet
    case IrancellWeeklyInternet
    case IrancellMonthlyInternet
    case IrancellLongTimeInternet
    case IrancellAmazingInternet
    case HamrahAvalCreditCard
    case Other
    
    public func getServiceCode()->Int{
        switch self {
        case .None:
            return 0
        case .IrancellDaylyInternet:
            return 9
        case .IrancellWeeklyInternet:
            return 10
        case .IrancellMonthlyInternet:
            return 11
        case .IrancellLongTimeInternet:
            return 12
        case .IrancellAmazingInternet:
            return 8
        case .HamrahAvalCreditCard:
            return 1
        default:
            return -1
        }
    }
    
    public mutating func getCaption(index:Int)->String{
        switch index {
        case 0:
            self = .IrancellDaylyInternet
            return "MYS_CAPTION_IRANCELLDAYLYINTERNET"
        case 1:
            self = .IrancellWeeklyInternet
            return "MYS_CAPTION_IRANCELLWEEKLYINTERNET"
        case 2:
            self = .IrancellMonthlyInternet
            return "MYS_CAPTION_IRANCELLMONTHLYINTERNET"
        case 3:
            self = .IrancellLongTimeInternet
            return "MYS_CAPTION_IRANCELLLONGTIMEINTERNET"
        case 4:
            self = .IrancellAmazingInternet
            return "MYS_CAPTION_IRANCELLAMAZINGINTERNET"
        default:
            return ""
        }
    }
    
    public func simpaleDiscription()->String{
        
        switch self {
        case .None:
            return ""
        case .IrancellDaylyInternet:
            return "MYS_CAPTION_IRANCELLDAYLYINTERNET"
        case .IrancellWeeklyInternet:
            return "MYS_CAPTION_IRANCELLWEEKLYINTERNET"
        case .IrancellMonthlyInternet:
            return "MYS_CAPTION_IRANCELLMONTHLYINTERNET"
        case .IrancellLongTimeInternet:
            return "MYS_CAPTION_IRANCELLLONGTIMEINTERNET"
        case .IrancellAmazingInternet:
            return "MYS_CAPTION_IRANCELLAMAZINGINTERNET"
        default:
            return ""
        }
    }
}// Internet Charge Type

public enum enumViraCommonTypes : Int{
    case None
    case Payment
    case TopUp
    case Bill
    case SMS
    case Charity
    case Other
    
    public func getCommonTypeCode()->Int{
        
        switch self {
        case .None:
            return -1
        case .Payment:
            return 0
        case .TopUp:
            return 1
        case .Bill:
            return 2
        case .SMS:
            return 3
        case .Charity:
            return 4
        default:
            return -2
        }
    }
    
    public func simpaleDiscription()->String{
        
        switch self {
        case .None:
            return ""
        case .Payment:
            return "MYS_PAYMENT"
        case .TopUp:
            return "MYS_TOPUP"
        case .Bill:
            return "MYS_BILL"
        case .SMS:
            return "MYS_SMS"
        case .Charity:
            return "MYS_CHARITY"
        default:
            return ""
        }
    }
}// Vira Common Types

enum enumCharitySerivceID : Int{
    case None
    case EBHome
    case MirrorCandleStick
    case AloneSmall
    case PublicBill
    case Other
    
    public func getServiceCode()->Int{
        
        switch self {
        case .None:
            return 0
        case .EBHome:
            return 100
        case .MirrorCandleStick:
            return 101
        case .AloneSmall:
            return 109
        case .PublicBill:
            return 75
        default:
            return -1
        }
    }
    
    public func simpaleDiscription()->String{
        
        switch self {
        case .None:
            return ""
        case .EBHome:
            return "MYS_EBHOME"
        case .MirrorCandleStick:
            return "MYS_MIRRORCANDLESTICK"
        case .AloneSmall:
            return "MYS_ALONESMALL"
        case .PublicBill:
            return "MYS_PUBLICBILL"
        default:
            return ""
        }
    }
}






public enum enumChargePrices{
    case None
    case CH1000
    case CH2000
    case CH5000
    case CH10000
    case CH20000
    
    public mutating func getCaption(index:Int)->String{
        switch index {
        case 0:
            self = .CH1000
            return "10000"
        case 1:
            self = .CH2000
            return "20000"
        case 2:
            self = .CH5000
            return "50000"
        case 3:
            self = .CH10000
            return "100000"
        case 4:
            self = .CH20000
            return "200000"
        default:
            return ""
        }
    }
    
    public mutating func getCaptionWithCamma(index:Int)->String{
        switch index {
        case 0:
            self = .CH1000
            return "10000".seprateWithCamma()
        case 1:
            self = .CH2000
            return "20000".seprateWithCamma()
        case 2:
            self = .CH5000
            return "50000".seprateWithCamma()
        case 3:
            self = .CH10000
            return "100000".seprateWithCamma()
        case 4:
            self = .CH20000
            return "200000".seprateWithCamma()
        default:
            return ""
        }
    }
    
    public mutating func getCaptionWithCurrency()->String{
        switch self {
        case .CH1000:
            return "\("10000".seprateWithCamma()) \("MYS_RIAL".localized)"
        case .CH2000:
            return "\("20000".seprateWithCamma()) \("MYS_RIAL".localized)"
        case .CH5000:
            return "\("50000".seprateWithCamma()) \("MYS_RIAL".localized)"
        case .CH10000:
            return "\("100000".seprateWithCamma()) \("MYS_RIAL".localized)"
        case .CH20000:
            return "\("200000".seprateWithCamma()) \("MYS_RIAL".localized)"
        default:
            return ""
        }
    }
    
    public mutating func getCaptionWithCurrency(index:Int)->String{
        switch index {
        case 0:
            self = .CH1000
            return "\("10000".seprateWithCamma()) \("MYS_RIAL".localized)"
        case 1:
            self = .CH2000
            return "\("20000".seprateWithCamma()) \("MYS_RIAL".localized)"
        case 2:
            self = .CH5000
            return "\("50000".seprateWithCamma()) \("MYS_RIAL".localized)"
        case 3:
            self = .CH10000
            return "\("100000".seprateWithCamma()) \("MYS_RIAL".localized)"
        case 4:
            self = .CH20000
            return "\("200000".seprateWithCamma()) \("MYS_RIAL".localized)"
        default:
            return ""
        }
    }
    
    public func GetAmount(opperator : enumOpperators)->String{
        if .CH1000 == self && opperator == enumOpperators.Irancell{
            return "10900"
        }else if .CH1000 == self && opperator != enumOpperators.Irancell{
            return "10900"
        }
        if .CH2000 == self && opperator == enumOpperators.Irancell{
            return "21800"
        }else if .CH1000 == self && opperator != enumOpperators.Irancell{
            return "20000"
        }
        if .CH5000 == self && opperator == enumOpperators.Irancell{
            return "54500"
        }else if .CH5000 == self && opperator != enumOpperators.Irancell{
            return "50000"
        }
        if .CH10000 == self && opperator == enumOpperators.Irancell{
            return "109000"
        }else if .CH1000 == self && opperator != enumOpperators.Irancell{
            return "100000"
        }
        if .CH20000 == self && opperator == enumOpperators.Irancell{
            return "218000"
        }else if .CH2000 == self && opperator != enumOpperators.Irancell{
            return "200000"
        }
        return ""
    }
}

public enum enumCharityInstitute{
    case None
    case KochakTanha
    case EBHome
    case AyeneShamdan
    
    public mutating func getCaption(index:Int)->String{
        switch index {
        case 0:
            self = .KochakTanha
            return "MYS_SMALLALONE"
        case 1:
            self = .EBHome
            return "MYS_EBHOME"
        case 2:
            self = .AyeneShamdan
            return "MYS_MIRRORSCANDLE"
        default:
            return ""
        }
    }
    
    public mutating func getServiceId()->Int{
        switch self {
        case .KochakTanha:
            return 109
        case .EBHome:
            return 100
        case .AyeneShamdan:
            return 101
        default:
            return 0
        }
    }
    
    public func simpaleDiscription()->String{
        switch self {
        case .KochakTanha:
            return "MYS_SMALLALONE"
        case .EBHome:
            return "MYS_EBHOME"
        case .AyeneShamdan:
            return "MYS_MIRRORSCANDLE"
        default:
            return ""
        }
    }
}

public enum enumTheme{
    case None
    case Default
    case blueOrang
    case blackYellow
    case grayOrange
    case gold
    case blue
    case green
    case red
    case revred
    
    public func getName()->String{
        switch self {
        case .Default:
            return "MYS_DEFAULT"
        case .blueOrang:
            return "MYS_BLUEORANGE"
        case .blackYellow:
            return "MYS_BLACKYELLOW"
        case .grayOrange:
            return "MYS_GRAYORANGE"
        default:
            return ""
        }
    }
    
    static public func getThemeByName(name:String)->enumTheme{
        switch name {
        case "MYS_DEFAULT":
            return enumTheme.Default
        case "MYS_BLUEORANGE":
            return enumTheme.blueOrang
        case "MYS_BLACKYELLOW":
            return  enumTheme.blackYellow
        case "MYS_GRAYORANGE":
            return enumTheme.grayOrange
        default:
            return enumTheme.None
        }
    }
}

public enum enumMessageType : Int{
    case none = 0
    case info  = 1
    case warning = 2
    case error = 3
    case success = 4
}

public enum enumBillType : Int{
    case None = 0
    case Water  = 1
    case Gas = 2
    case Electricity = 3
    case Mobile = 4
    case Phone = 5
    case Municipality  = 6
    case Penalty = 9
    
    public func getName()->String{
        switch self {
        case .Water:
            return "MYS_ENUMS_WATERBILL"
        case .Gas:
            return "MYS_ENUMS_GASBILL"
        case .Electricity:
            return "MYS_ENUMS_ELECTRICITYBILL"
        case .Mobile:
            return "MYS_ENUMS_MOBILEBIL"
        case .Phone:
            return "MYS_ENUMS_PHONEBILL"
        case .Penalty:
            return "MYS_ENUMS_PENALTY"
        case .Municipality:
            return "MYS_ENUMS_MUNICIPALITYBILL"
        default:
            return ""
        }
    }
    
    static public func getCompanyByName(id:Int)->String{
        switch id {
        case 1:
            return "MYS_ENUMS_WATERBILL"
        case 2:
            return "MYS_ENUMS_ELECTRICITYBILL"
        case 3:
            return "MYS_ENUMS_GASBILL"
        case 4:
            return "MYS_ENUMS_PHONEBILL"
        case 5:
            return "MYS_ENUMS_MOBILEBILL"
        case 6:
            return "MYS_ENUMS_MUNICIPALITYBILL"
        case 9:
            return "MYS_ENUMS_PENALTY"
        default:
            return ""
        }
    }
}


public enum enumBarCode : Int{
    case none = 0
    case bar  = 1
    case qr = 2
    case both = 3
}


public enum enumDeviceType : String {
    case simulator     = "simulator/sandbox",
    iPod1              = "iPod 1",
    iPod2              = "iPod 2",
    iPod3              = "iPod 3",
    iPod4              = "iPod 4",
    iPod5              = "iPod 5",
    iPad2              = "iPad 2",
    iPad3              = "iPad 3",
    iPad4              = "iPad 4",
    iPad5              = "iPad 5",
    iPhone4            = "iPhone 4",
    iPhone4S           = "iPhone 4S",
    iPhone5            = "iPhone 5",
    iPhone5S           = "iPhone 5S",
    iPhone5C           = "iPhone 5C",
    iPadMini1          = "iPad Mini 1",
    iPadMini2          = "iPad Mini 2",
    iPadMini3          = "iPad Mini 3",
    iPadAir1           = "iPad Air 1",
    iPadAir2           = "iPad Air 2",
    iPadPro9_7         = "iPad Pro 9.7\"",
    iPadPro9_7_cell    = "iPad Pro 9.7\" cellular",
    iPadPro12_9        = "iPad Pro 12.9\"",
    iPadPro12_9_cell   = "iPad Pro 12.9\" cellular",
    iPadPro2_12_9      = "iPad Pro 2 12.9\"",
    iPadPro2_12_9_cell = "iPad Pro 2 12.9\" cellular",
    iPhone6            = "iPhone 6",
    iPhone6plus        = "iPhone 6 Plus",
    iPhone6S           = "iPhone 6S",
    iPhone6Splus       = "iPhone 6S Plus",
    iPhoneSE           = "iPhone SE",
    iPhone7            = "iPhone 7",
    iPhone7plus        = "iPhone 7 Plus",
    iPhone8            = "iPhone 8",
    iPhone8plus        = "iPhone 8 Plus",
    iPhoneX            = "iPhone X",
    unrecognized       = "?unrecognized?"
}





public var ErrorListUser = [
    "00":" ",
    "6":"بروز خطا /شاپرک",
    "7":"به دلیل شرایط خاص کارت توسط دستگاه ضبط شود. ",
    "15":"صادرکننده کارت نامعتبر است.(وجود ندارد)",
    "33":"تاریخ انقضای کارت سپری شده است. کارت توسط دستگاه ضبط گردد.",
    "34":"کارت مظنون به تقلب است.  کارت توسط دستگاه ضبط گردد./ تراکنش اصلی با موفقیت صورت نپذیرفته است.",
    "36":"کارت دارای محدودیت می باشد – ضبط کارت",
    "38":"تعداد دفعات ورود رمز غلط بیش از حد مجاز است. کارت توسط دستگاه ضبط شود.",
    "39":"کارت حساب اعتباری ندارد.",
    "41":"کارت مفقودی می باشد. کارت توسط دستگاه ضبط شود.",
    "42":"حساب عمومی وجود ندارد – تراکنش لغو شد",
    "43":"کارت مسروقه می باشد. کارت توسط دستگاه ضبط گردد.",
    "44":"کارت حساب سرمایه گذاری ندارد.",
    "51":"موجودی حساب کافی نیست – تراکنش لغو شد",
    "52":"کارت حساب جاری ندارد.",
    "53":"کارت حساب قرض الحسنه ندارد.",
    "54":"تاریخ انقضای کارت سپری شده است.",
    "55":"رمز اشتباه است – تراکنش لغو شد.",
    "56":"کارت نامعتبر است.",
    "57":"انجام تراکنش مربوطه  توسط دارنده کارت مجاز نمی باشد.",
    "58":"انجام تراکنش مربوطه  توسط پایانه انجام دهنده مجاز نمی باشد.",
    "59":"کارت مظنون به تقلب است.",
    "61":"مبلغ تراکنش بیش از حد مجاز است.",
    "62":"کارت محدود شده است.",
    "63":"تمهیدات امنیتی نقض گردیده است.",
    "65":"تعداد درخواست تراکنش بیش از حد مجاز می باشد.",
    "66":"مبلغ از سقف دوره ای برداشت نقدی بیشتر است – تراکنش لغو شد",
    "75":"تعداد دفعات مجاز رمز غلط بیش از حد مجاز می باشد.",
    "78":"کارت فعال نیست.",
    "90":" سامانه مقصد تراکنش در حال انجام عملیات پایان روز می‌باشد.",
    "92":"موسسه مالی یا شبکه ارتباطی جهت مسیر یابی در دسترس نیست – تراکنش لغو شد",
    "94":"ارسال تراکنش تکراری"
]
