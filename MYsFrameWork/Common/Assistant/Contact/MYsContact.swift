//
//  MYsContact.swift
//  MYsFrameWork
//
//  Created by Malihe on 10/22/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import Foundation
import ContactsUI


open class MYsContacts :NSObject{
    
    open func checkContact(number:String)->CNContact?{
        var result : CNContact?
        let contactStore = CNContactStore()
        let keys = [CNContactPhoneNumbersKey, CNContactFamilyNameKey, CNContactGivenNameKey, CNContactNicknameKey, CNContactPhoneNumbersKey]
        let request1 = CNContactFetchRequest(keysToFetch: keys  as [CNKeyDescriptor])

        try? contactStore.enumerateContacts(with: request1) { (contact, error) in
            for phone in contact.phoneNumbers {
                let num = (phone.value.stringValue.enNumber as NSString).replacingCharacters(in: NSMakeRange(0, 1) , with: "98") as String
                if num == number.enNumber{
                    result = contact
                    break
                }
            }// end for
        }
        return result
    }
}
