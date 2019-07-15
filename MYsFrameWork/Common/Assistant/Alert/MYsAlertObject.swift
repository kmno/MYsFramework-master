//
//  FCAlertObject.swift
//  AVAPayments
//
//  Created by mahdi yousefpour on 6/15/17.
//  Copyright © 2017 Mahdi Yousefpour. All rights reserved.
//

import UIKit


open class MYsAlertObject:NSObject,UIPopoverPresentationControllerDelegate {
    
    open var model = MYsAlertModel()
    open var simpleAlert = MYsSimpleAlertViewController()
    open var fromBottomAlert = MYsErrorFromBottomViewController()
    
    public override init() {
        simpleAlert = MYsSimpleAlertViewController(nibName: "MYsSimpleAlertViewController", bundle: Bundle(identifier: "com.myousefpour.MYsFrameWork"))
        fromBottomAlert = MYsErrorFromBottomViewController(nibName: "MYsErrorFromBottomViewController", bundle: Bundle(identifier: "com.myousefpour.MYsFrameWork"))
    }
    
    open var fillRequiredField:MYsAlertModel{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_FILLREQUIREDFIELDS".localized
            //model.logoName = ""
            return model
    }
    
    open var signOut:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_AREYOUSURESIGNOUT".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var minCharacter:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INVALIDMINCHARACTERS".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var maxCharacter:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INVALIDMAXCHARACTERS".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var invalidCard:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INVALIDCARD".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var timeout:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_TIMEOUTTRYAGAIN".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var invalidDestinationCard:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INVALIDDESTINATIONCARD".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var invalidNationalCode:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "BP_ERROR_INVALIDNID".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var compareCardNumbers:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_COMPARECARDS".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var invalidName:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INVALIDName".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var invalidMessage:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INVALIDMESSAGE".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var invalidEmail:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INVALIDEMAIL".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var invalidUserName:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INVALIDUSERNAME".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var invalidBarcode:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INVALIDBARCODE".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var invalidCardBank:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INVALIDPANBANK".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var invalidPin:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INVALIDPIN".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var invalidCVV2:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INVALIDCVV2".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var invalidExpireDate:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INVALIDEXPIREDATE".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var existData:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_EXISTDATA".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var existCard:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_EXISTCARD".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var serviceNotAvailable:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_MAILSERVICESNOTAVAILABLE".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var writeCorrectNumber:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_WRITECORRECTFORMATNUMBER".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var notRegister:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_NOTREGISTER".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var invalidMobile:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INVALIDMOBILENUMBER".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var fillMobileNumber:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_FILLMOBILENUMBER".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var fillCode:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_FILLCODE".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var invalidCode:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INVALIDCARD".localized
            //model.logoName = ""
            return model
        }
    }
    
    
    open var titleEmpty:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_TITLEISEMPTY".localized
            //model.logoName = ""
            return model
        }
    }
    
    
    open var cardNumberEmpty:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_CARDNUMBERISEMPTY".localized
            //model.logoName = ""
            return model
        }
    }
    

    open var opperationSuccessfuly:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "".localized
            model.message = "MYS_ALERT_OPPERATIONSUCCESSFULY".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var opperationFailed:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_OPPERATIONFAILED".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var cardAddedSuccesfully:MYsAlertModel{
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_CARDADDED".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var answerIsNotCorrect:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_ANSWERISNOTCORRECT".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var fillAnswer:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_FILLANSWER".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var limitDailyAnswer:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_DAILYLIMITANSWER".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var checkInternetConnection:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_CHECKINTERNETCONNECTION".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var selectOpperator:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_SELECTOPPERATOR".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var uploadedFile:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_INFO_UPLOADEDDATA".localized
            //model.logoName = ""
            return model
        }
    }
    
    
    open var selectInternetType:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_SELECTINTERNETTYPE".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var selectInternetValue:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_INTERNETVALUE".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var selectProfile:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_FILLCHARGETYPE".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var selectPrice:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_FILLPRICE".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var chooseContactNumber:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_CHOOSECONTACTNUMBER".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var fillPassword:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_PASSWORDLENGTH".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var fillCardNumber:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_FILLCARDNUMBER".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var isNumeric:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ERROR_NUMBERIC".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var serviceComingSoon:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_SERVICECOMINGSOON".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var selectCharityInstitute:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_SELECTCHARITY".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var fillCharityInstitutePrice:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_FILLCHARITYPRICE".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var fillBillId:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_BILLID".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var fillPayId:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_FILLPAYID".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var transactionPay:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ALERT_FILLCHARITYPRICE".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var badRequest:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ERROR_BADREQUEST".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var serverNotFound:MYsAlertModel{
        set{ model = newValue}
        get{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ERROR_SERVERNOTFOUND".localized
            //model.logoName = ""
            return model
        }
    }
    
    open var dataNotFound:MYsAlertModel{
            model.title = "MYS_CAPTION_CAUTION".localized
            model.message = "MYS_ERROR_DATAWASNOTFOUND".localized
            return model
    }
    
    open var deviceDoesNotSupportCall:MYsAlertModel{
        model.doneTitle = "MYS_CAPTION_OK".localized
        model.title = "MYS_CAPTION_CAUTION".localized
        model.message = "MYS_ERROR_DEVICEDOESNOTSUPPORTCALL".localized
        return model
    }
    
    
    
    
    
    private func baseShowAlert(target:UIViewController, title:String, message:String, logoName:String,  actionType:enumStatus){
        
        let viewController = MYsSimpleAlertViewController(nibName: "MYsSimpleAlertViewController", bundle: Bundle(identifier: "com.myousefpour.MYsFrameWork"))
        viewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        viewController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        target.present(viewController, animated: false) {
            UIView.animate(withDuration: 0.4, animations: {
                viewController.lblTitle.text = title
                viewController.lblMessage.text = message
                viewController.btnOk.setTitle("MYS_CAPTION_OK".localized, for: .normal)
                viewController.btnCancel.setTitle("MYS_CAPTION_CANCEL".localized, for: .normal)
                viewController.btnCancel.isHidden = true
              viewController.initial()
            })
        }
    }
    
    public func showAlert(target:UIViewController, message:String,complition:(()->())? = nil){
        baseShowAlert(target: target, title: "MYS_CAPTION_CAUTION".localized, message: message,logoName: "", actionType: .caution)
        if (complition != nil) {
            complition!()
        }
    }
    
    public func showAlert(target:UIViewController, model:MYsAlertModel,complition:(()->())? = nil){
        baseShowAlert(target: target, title: model.title.localized, message: model.message.localized,logoName: "", actionType: .caution)
        if (complition != nil) {
            complition!()
        }
    }
    
   
}
