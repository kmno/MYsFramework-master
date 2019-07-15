//
//  MYsCardsManagement.swift
//  MYsFramework
//
//  Created by Mahdi Yousefpour on 5/9/17.
//  Copyright © 2017 Mahdi Yousefpour. All rights reserved.
//

import Foundation

public class MYsCardManagements{
    
    
    static public func getSecureCard(cardNumber:String) -> String{
        if cardNumber.enNumber.ToInt() == 0{
            return cardNumber
        }
        
        if !cardNumber.isEmpty && cardNumber.count > 15 && cardNumber.count < 20 {
            let tCardNumber = cardNumber.withoutSpace()
            let secureCardNumber = tCardNumber.subString(offSet: 6 , length: 6)!.ToInt().ToString()
            let str = tCardNumber.replacingOccurrences(of: secureCardNumber, with: "******").SeprateForCreditCard()
            return str
        }else{
            if !cardNumber.isEmpty{
                let tCardNumber = cardNumber.withoutSpace()
                let secureCardNumber = tCardNumber.subString(offSet: 6 , length: 9)!
                return tCardNumber.replacingOccurrences(of: secureCardNumber, with: "******").SeprateForCreditCard()
            }
        }
        return ""
    }
    
    static public func getMaskCard(cardNumber:String) -> String{
        if cardNumber.enNumber.ToInt() == 0{
            return cardNumber
        }
        
        var number = ""
        if !cardNumber.isEmpty && cardNumber.count > 15 && cardNumber.count < 20 {
            let tCardNumber = cardNumber.withoutSpace()
            let secureCardNumber = tCardNumber.subString(offSet: 6 , length: 6)
            number = tCardNumber.replacingOccurrences(of: secureCardNumber!, with: "******").SeprateWithDashCreditCard()
        }else if !cardNumber.isEmpty{
            let tCardNumber = cardNumber.withoutSpace()
            let secureCardNumber = tCardNumber.subString(offSet: 6 , length: 9)
            number = tCardNumber.replacingOccurrences(of: secureCardNumber!, with: "******").SeprateWithDashCreditCard()
        }
        
        return number
    }
    
    static public func isValidCard(cardNumber:String) -> Bool{
        let tCardNumber = cardNumber.encodeToENNumber(false)
        var sum = 0
        let reversedCharacters = tCardNumber.reversed().map { String($0) }
        for (idx, element) in reversedCharacters.enumerated() {
            guard let digit = Int(element) else { return false }
            switch ((idx % 2 == 1), digit) {
            case (true, 9): sum += 9
            case (true, 0...8): sum += (digit * 2) % 9
            default: sum += digit
            }
        }
        return sum % 10 == 0
    }
    
    static public func cardColors(pan:String) -> [UIColor]{
        if pan.isEmpty {
            return [.black,.white]
        }
        let iPan = pan.enNumber.subString(offSet: 0, length: 6)!.ToInt()
        switch iPan {
        case 610433:
            return [UIColor("#FFFFFF"),UIColor("#E25064")]
        case 603799:
            return [UIColor("#0072C1"),UIColor("#007351")]//"بانک ملی ایران";
        case 603769:
            return [UIColor("#02478B"),UIColor("#6098D6")]//"بانک صادرات";
        case 603770:
            return [UIColor("#E8E08C"),UIColor("#C7BF60")]// "بانک کشاورزی";
        case 589210:
            return [UIColor("#FFECD5"),UIColor("#E6BF6B")]// "بانک سپه";
        case 627353:
            return [UIColor("#00C0D9"),UIColor("#0091AD")]// "بانک تجارت";
        case 628023:
            return [UIColor("#FFECD5"),UIColor("#D59C39")]// "بانک مسکن";
        case 627648:
            return [UIColor("#FFFFFF"),UIColor("#C9C9C9")]// "بانک توسعه و صادرات ایران";
        case 627961:
            return [UIColor("#FFECD5"),UIColor("#E6BF6B")]// "بانک صنعت و معدن";
        case 627760:
            return [UIColor("#5EB587"),UIColor("#046C35")]// "پست بانک";
        case 621986:
            return [UIColor("#FFFFFF"),UIColor("#BFBFBF")]// "بانک سامان";
        case 627412:
            return [UIColor("#DDCBE8"),UIColor("#9068B4")]//"بانک اقتصاد نوین";
        case 639607:
            return [UIColor("#FFFFFF"),UIColor("#00B7C7")]//"بانک سرمایه";
        case 627488:
            return [UIColor("#FFFFFF"),UIColor("#D6A55A")]// "بانک کارآفرین";
        case 622106:
            return [UIColor("#D15F64"),UIColor("#90000F")]//"بانک پارسیان";
        case 639346:
            return [UIColor("#E5DDC6"),UIColor("#9C8A59")]// "بانک سینا";
        case 589463:
            return [UIColor("#FDFDFD"),UIColor("#ACACAC")]//"بانک رفاه کارگران";
        case 502229:
            return [UIColor("#21464F"),UIColor("#132D37")]//"بانک پاسارگاد";
        case 628157:
            return [UIColor("#C64144"),UIColor("#950D10")]// "موسسه اعتباری توسعه";
        case 502908:
            return [UIColor("#E6E6E6"),UIColor("#E5E5E5")]// "بانک توسعه تعاون";
        case 502938:
            return [UIColor("#EBEBEB"),UIColor("#FFFFFF")]// "بانک دی";
        case 606373:
            return [UIColor("#066F35"),UIColor("#00A941")]//"بانک قرض الحسنه مهر ایران";
        case 627381:
            return [UIColor("#E8E8E8"),UIColor("#919191")]// "بانک انصار";
        case 636214:
            return [UIColor("#FFECD5"),UIColor("#E6BF6B")]// "بانک آینده";
        case 504706:
            return [UIColor("#980014"),UIColor("#CC0019")]//"بانک شهر";
        case 636949:
            return [UIColor("#96A5D6"),UIColor("#D8DAEA")]//"بانک حکمت ایرانیان";
        case 505785:
            return [UIColor("#DCCFEB"),UIColor("#E5DFF9")]//"بانک ایران زمین";
        case 505416:
            return [UIColor("#CFE7ED"),UIColor("#00B4D1")]//"بانک گردشگری";
        case 636795:
            return [UIColor("#19387A"),UIColor("#008FCE")]//"اداره معاملات بانک مرکزی";
        case 505801:
            return [UIColor("#C5ACB9"),UIColor("#F5F0F1")]//"موسسه مالی و اعتباری کوثر";
        case 606256:
            return [UIColor("#F9BB08"),UIColor("#F57E20")]//"موسسه مالی و اعتباری عسکریه"; یا ملل
        case 504172:
            return [UIColor("#DCDCDC"),UIColor("#FCFCFC")]//"بانک قرض الحسنه رسالت";
        case 505809:
            return [UIColor("#262722"),UIColor("#9E9FA3")]// "بانک خاورمیانه";
        case 585947:
            return [UIColor("#262722"),UIColor("#9E9FA3")]// "بانک خاورمیانه - سوییچ دوم";
        case 581874:
            return [UIColor("#BFBFBF"),UIColor("#D4EEFF")]// "بانک ایران ونزويلا";
        case 639599:
            return [UIColor("#F0F6EF"),UIColor("#FFFFFD")]// "بانک قوامین";
        case 581672:
            return [UIColor("#1B1500"),UIColor("#E9D100")]// "شاپرک";
        case 639370:
            return [UIColor("#FFFFFF"),UIColor("#FFB745")]// "موسسه مالی و اعتباری مهر";
        case 585983:
            return [UIColor("#00C0D9"),UIColor("#0091AD")]//"بانک تجارت";
        case 604932:
            return [UIColor("#FFECD5"),UIColor("#E6BF6B")]//"بانک سپه";
        default:
            return [UIColor("#1B1500"),UIColor("#E9D100")]// "بانک جدید";
        }
        
    }
    
//    static public func bankName(pan:String)->String{
//        return ""
//    }
    
    static public func cardModel(cardModel:MYsBankCardModel) -> MYsBankCardModel{
        let model = MYsCardManagements.cardModel(pan: cardModel.pan)
        model.pan = cardModel.pan
        model.expireDate = cardModel.expireDate
        model.cvv2 = cardModel.cvv2
        return model
    }
    
    static public func cardModel(pan:String) -> MYsBankCardModel{
        let cardModel = MYsBankCardModel()
        if pan.count < 6{
            return cardModel
        }

        let iPan = pan.enNumber.subString(offSet: 0, length: 6)!.ToInt()
        switch iPan {
        case 610433:
            cardModel.pan = pan
            cardModel.bankName =  "بانک ملت"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#FFFFFF"),UIColor("#E25064")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#404041")
            cardModel.ownerColor = UIColor("#FFFFFF")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#E85658").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 603799:
            cardModel.pan = pan
            cardModel.bankName = "بانک ملی ایران"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#0072C1"),UIColor("#007351")]
            cardModel.panColor = UIColor("#FFFFFF")
            cardModel.bankColor = UIColor("#CECECE")
            cardModel.ownerColor = UIColor("#CECECE")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#007356").withAlphaComponent(0.3)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 603769:
            cardModel.pan = pan
            cardModel.bankName = "بانک صادرات"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#02478B"),UIColor("#6098D6")]
            cardModel.panColor = UIColor("#FFFFFF")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#FFFFFF")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#0058FF").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 603770:
            cardModel.pan = pan
            cardModel.bankName = "بانک کشاورزی"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#E8E08C"),UIColor("#C7BF60")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#404041")
            cardModel.ownerColor = UIColor("#404041")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#FFAE00").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 589210:
            cardModel.pan = pan
            cardModel.bankName = "بانک سپه"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#FFECD5"),UIColor("#E6BF6B")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#7B301C")
            cardModel.ownerColor = UIColor("#7B301C")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#FFAE00").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 627353:
            cardModel.pan = pan
            cardModel.bankName = "بانک تجارت";
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#00C0D9"),UIColor("#0091AD")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#FFFFFF")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#0094AF").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 628023:
            cardModel.pan = pan
            cardModel.bankName = "بانک مسکن"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#FFECD5"),UIColor("#D59C39")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#F25920")
            cardModel.ownerColor = UIColor("#F25920")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#FFAE00").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 627648:
            cardModel.pan = pan
            cardModel.bankName = "بانک توسعه و صادرات ایران"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#FFFFFF"),UIColor("#C9C9C9")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#404041")
            cardModel.ownerColor = UIColor("#046B10")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#000000").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
            return cardModel
        case 627961:
            cardModel.pan = pan
            cardModel.bankName = "بانک صنعت و معدن"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#FFECD5"),UIColor("#E6BF6B")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#7B301C")
            cardModel.ownerColor = UIColor("#046B10")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#FFAE00").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
            return cardModel
        case 627760:
            cardModel.pan = pan
            cardModel.bankName = "پست بانک"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#5EB587"),UIColor("#046C35")]
            cardModel.panColor = UIColor("#FFFFFF")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#FFFFFF")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#009688").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
            return cardModel
        case 621986:
            cardModel.pan = pan
            cardModel.bankName = "بانک سامان"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#FFFFFF"),UIColor("#BFBFBF")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#B200A8")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#B200A8").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 627412:
            cardModel.pan = pan
            cardModel.bankName = "بانک اقتصاد نوین"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#DDCBE8"),UIColor("#9068B4")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#B200A8")
            cardModel.ownerColor = UIColor("#B200A8")
            cardModel.backgoundColor = UIColor("v")
            cardModel.CardShadowColor = UIColor("#B200A8").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 639607:
            cardModel.pan = pan
            cardModel.bankName = "بانک سرمایه"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#FFFFFF"),UIColor("#00B7C7")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#B200A8")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#214B6A").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 627488:
            cardModel.pan = pan
            cardModel.bankName =  "بانک کارآفرین"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#FFFFFF"),UIColor("#D6A55A")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#302693")
            cardModel.ownerColor = UIColor("#302693")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#FFAE00").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 622106:
            cardModel.pan = pan
            cardModel.bankName = "بانک پارسیان"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#90000F"),UIColor("#D15F64")]
            cardModel.panColor = UIColor("#FFFFFF")
            cardModel.bankColor = UIColor("#DEE4E0")
            cardModel.ownerColor = UIColor("#DEE4E0")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#FFAE00").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 639346:
            cardModel.pan = pan
            cardModel.bankName = "بانک سینا"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#E5DDC6"),UIColor("#9C8A59")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#000000")
            cardModel.ownerColor = UIColor("#000000")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#FFAE00").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 589463:
            cardModel.pan = pan
            cardModel.bankName = "بانک رفاه کارگران"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#FDFDFD"),UIColor("#ACACAC")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#004B7F")
            cardModel.ownerColor = UIColor("#404041")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#1C1C1C").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 502229:
            cardModel.pan = pan
            cardModel.bankName = "بانک پاسارگاد"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#21464F"),UIColor("#132D37")]
            cardModel.panColor = UIColor("#FFFFFF")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#FFFFFF")
            cardModel.backgoundColor = UIColor("#FFFFFF")
            cardModel.CardShadowColor = UIColor("#132E38").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 628157:
            cardModel.pan = pan
            cardModel.bankName =  "موسسه اعتباری توسعه"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#C64144"),UIColor("#950D10")]
            cardModel.panColor = UIColor("#FFFFFF")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#FFFFFF")
            cardModel.backgoundColor = UIColor("#FFFFFF")
            cardModel.CardShadowColor = UIColor("#910F12").withAlphaComponent(0.4)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 502908:
            cardModel.pan = pan
            cardModel.bankName =  "بانک توسعه تعاون"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#E6E6E6"),UIColor("#E5E5E5")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#8D8D8D")
            cardModel.ownerColor = UIColor("#8D8D8D")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#000000").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 502938:
            cardModel.pan = pan
            cardModel.bankName = "بانک دی"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#EBEBEB"),UIColor("#FFFFFF")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#484848")
            cardModel.ownerColor = UIColor("#484848")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("")
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 606373:
            cardModel.pan = pan
            cardModel.bankName = "بانک قرض الحسنه مهر ایران"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#066F35"),UIColor("#00A941")]
            cardModel.panColor = UIColor("#FFFFFF")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#FFFFFF")
            cardModel.backgoundColor = UIColor("#FFFFFF")
            cardModel.CardShadowColor = UIColor("#000000").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 627381:
            cardModel.pan = pan
            cardModel.bankName = "بانک انصار"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#E8E8E8"),UIColor("#919191")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#FFCC29")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#000000").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 636214:
            cardModel.pan = pan
            cardModel.bankName = "بانک آینده"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#FFECD5"),UIColor("#E6BF6B")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#7B301C")
            cardModel.ownerColor = UIColor("#7B301C")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#FFAE00").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 504706:
            cardModel.pan = pan
            cardModel.bankName = "بانک شهر"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#980014"),UIColor("#CC0019")]
            cardModel.panColor = UIColor("#FFFFFF")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#FFFFFF")
            cardModel.backgoundColor = UIColor("#FFFFFF")
            cardModel.CardShadowColor = UIColor("#E85658").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 636949:
            cardModel.pan = pan
            cardModel.bankName = "بانک حکمت ایرانیان"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#96A5D6"),UIColor("#D8DAEA")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#015BAA")
            cardModel.ownerColor = UIColor("#015BAA")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#015BAA").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 505785:
            cardModel.pan = pan
            cardModel.bankName = "بانک ایران زمین"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#DCCFEB"),UIColor("#E5DFF9")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#9933A8")
            cardModel.ownerColor = UIColor("#9933A8")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#9984C1").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 505416:
            cardModel.pan = pan
            cardModel.bankName = "بانک گردشگری"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#CFE7ED"),UIColor("#00B4D1")]
            cardModel.panColor = UIColor("#FFFFFF")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#FFFFFF")
            cardModel.backgoundColor = UIColor("#FFFFFF")
            cardModel.CardShadowColor = UIColor("#00B1FF").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 636795:
            cardModel.pan = pan
            cardModel.bankName = "اداره معاملات بانک مرکزی"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#19387A"),UIColor("#008FCE")]
            cardModel.panColor = UIColor("#FFFFFF")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#FFFFFF")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#FFAE00").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 505801:
            cardModel.pan = pan
            cardModel.bankName = "موسسه مالی و اعتباری کوثر"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#C5ACB9"),UIColor("#F5F0F1")]
            cardModel.panColor = UIColor("#404041")
            cardModel.bankColor = UIColor("#404041")
            cardModel.ownerColor = UIColor("#404041")
            cardModel.backgoundColor = UIColor("#404041")
            cardModel.CardShadowColor = UIColor("#CCB3C1").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 606256:
            cardModel.pan = pan
            cardModel.bankName = "موسسه مالی و اعتباری ملل"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#F9BB08"),UIColor("#F57E20")]
            cardModel.panColor = UIColor("#FFFFFF")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#FFFFFF")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#FFAE00").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 504172:
            cardModel.pan = pan
            cardModel.bankName = "بانک قرض الحسنه رسالت"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#DCDCDC"),UIColor("#FCFCFC")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#404041")
            cardModel.ownerColor = UIColor("#404041")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#009AAE").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 505809:
            cardModel.pan = pan
            cardModel.bankName = "بانک خاورمیانه"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#262722"),UIColor("#9E9FA3")]
            cardModel.panColor = UIColor("#FFFFFF")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#FFFFFF")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#FFAE00").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 585947:
            cardModel.pan = pan
            cardModel.bankName = "بانک خاورمیانه - سوییچ دوم"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#262722"),UIColor("#9E9FA3")]
            cardModel.panColor = UIColor("#FFFFFF")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#FFFFFF")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#FFAE00").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 581874:
            cardModel.pan = pan
            cardModel.bankName = "بانک ایران ونزويلا"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#BFBFBF"),UIColor("#D4EEFF")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#010966")
            cardModel.ownerColor = UIColor("#010966")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#000000").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 639599:
            cardModel.pan = pan
            cardModel.bankName = "بانک قوامین"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#F0F6EF"),UIColor("#FFFFFD")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#C00019")
            cardModel.ownerColor = UIColor("#C00019")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#095F3C").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 581672:
            cardModel.pan = pan
            cardModel.bankName = "شاپرک"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#1B1500"),UIColor("#E9D100")]
            cardModel.panColor = UIColor("")
            cardModel.bankColor = UIColor("")
            cardModel.ownerColor = UIColor("")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("")
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 639370:
            cardModel.pan = pan
            cardModel.bankName = "مهر اقتصاد";
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#FFFFFF"),UIColor("#FFB745")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#7B301C")
            cardModel.ownerColor = UIColor("#7B301C")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#FFAE00").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 585983:
            cardModel.pan = pan
            cardModel.bankName = "بانک تجارت"
            cardModel.backgoundColors = [UIColor("#00C0D9"),UIColor("#0091AD")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#FFFFFF")
            cardModel.ownerColor = UIColor("#FFFFFF")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#0094AF").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        case 604932:
            cardModel.pan = pan
            cardModel.bankName = "بانک سپه"
            cardModel.backgoundColors = [UIColor("#FFECD5"),UIColor("#E6BF6B")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#7B301C")
            cardModel.ownerColor = UIColor("#7B301C")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#FFAE00").withAlphaComponent(0.2)
            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        default:
            cardModel.pan = pan
            cardModel.bankName =  "بانک جدید"
            cardModel.logoName = ""
            cardModel.backgoundColors = [UIColor("#1B1500"),UIColor("#E9D100")]
            cardModel.panColor = UIColor("#000000")
            cardModel.bankColor = UIColor("#000000")
            cardModel.ownerColor = UIColor("#000000")
            cardModel.backgoundColor = UIColor("")
            cardModel.CardShadowColor = UIColor("#000000").withAlphaComponent(0.2)
//            //cardModel.logoImage =  UIImage(named:"ic_\(iPan)")!
        }
        return cardModel
    }
    
    
    
    
    
    
    
    
    
    
}
