//
//  MYsSecurityObject.swift
//  MYsFrameWork
//
//  Created by Malihe on 11/15/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import Foundation
import LocalAuthentication

open class MYsSecurity:NSObject{
    
    public func loginWithTouchId(complition:@escaping(_ isSuccess: Bool,_ error: String)->()) {
         
        // 1. Create a authentication context
        let authenticationContext = LAContext()
        var error:NSError?
        
        // 2. Check if the device has a fingerprint sensor
        // If not, show the user an alert view and bail out!
        guard authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
//            showAlertViewIfNoBiometricSensorHasBeenDetected()
            complition(false,MYsCaptions().DEVICEHASNOTTouchID)
            return
        }
        
        // 3. Check the fingerprint
        authenticationContext.evaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            localizedReason: "لطفا انگشت خود را در مقابل حسگر قرار دهید",
            reply: { [unowned self] (success, error) -> Void in
                if( success ) {
                    
                    // Fingerprint recognized
                    // Go to view controller
                    complition(true,"")
                }else {
                    
                    // Check if there is an error
                    if let error = error {
                       complition(true,self.errorMessageForLAErrorCode(error._code))
                    }
                }
        })
    }
    
    /**
     This method will present an UIAlertViewController to inform the user that the device has not a TouchID sensor.
     */
    func showAlertViewIfNoBiometricSensorHasBeenDetected(){
        //showAlertWithTitle("Error", message: "This device does not have a TouchID sensor.")
        
    }
    
    /**
     This method will present an UIAlertViewController to inform the user that there was a problem with the TouchID sensor.
     
     - parameter error: the error message
     
     */
    func showAlertViewAfterEvaluatingPolicyWithMessage( _ message:String ){
//        showAlertWithTitle("Error", message: message)
        
    }
    
    
    
    /**
     This method will return an error message string for the provided error code.
     The method check the error code against all cases described in the `LAError` enum.
     If the error code can't be found, a default message is returned.
     
     - parameter errorCode: the error code
     - returns: the error message
     */
    func errorMessageForLAErrorCode( _ errorCode:Int ) -> String{
        
        var message = ""
        
        switch errorCode {
            
        case LAError.Code.appCancel.rawValue:
            message = "اعتبار سنجی توسط برنامه لغو شد."
            
        case LAError.Code.authenticationFailed.rawValue:
            message = "دسترسی امکان پذیر نیست"
            
        case LAError.Code.invalidContext.rawValue:
            message = "اطلاعات معتبر نیست"
            
        case LAError.Code.passcodeNotSet.rawValue:
            message = "رمز عبور در دستگاه وجود ندارد"
            
        case LAError.Code.systemCancel.rawValue:
            message = "اعتبار سنجی توسط سیستم لفو گردید"
            
        case LAError.Code.touchIDLockout.rawValue:
            message = "تعداد اشتباه بیش از حد مجاز بوده است"
            
        case LAError.Code.touchIDNotAvailable.rawValue:
            message = "حسگر انگشت در دستگاه شما فعال نیست"
            
        case LAError.Code.userCancel.rawValue:
            message = "کاربر درخواست خود را لغو کرد"
            
        case LAError.Code.userFallback.rawValue:
            message = "کاربر تصمیم گرفت از جایگزین استفاده کند"
            
        default:
            message = "خطای نامشخص"
            
        }
        
        return message
        
    }
}
