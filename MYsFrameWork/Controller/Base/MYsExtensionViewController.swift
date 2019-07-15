//
//  MYsExtensionViewController.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 1/18/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    public func presentAsPopUp(viewcontroller:UIViewController,animated:Bool,completion:(()->Void)?){
//        self.definesPresentationContext = true
//        self.modalPresentationStyle = UIModalPresentationStyle.currentContext
//        self.navigationController?.modalPresentationStyle = UIModalPresentationStyle.currentContext
//        viewcontroller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        self.present(viewcontroller, animated: animated, completion: completion)
        self.definesPresentationContext = true
        self.modalPresentationStyle = UIModalPresentationStyle.popover
        self.navigationController?.modalPresentationStyle = UIModalPresentationStyle.popover
        viewcontroller.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        self.present(viewcontroller, animated: animated, completion: completion)
    }
    
    public func presentAsPopUpWithoutNavigation(viewcontroller:UIViewController,animated:Bool,completion:(()->Void)?){
        self.definesPresentationContext = true
        self.modalPresentationStyle = UIModalPresentationStyle.popover
        self.navigationController?.modalPresentationStyle = UIModalPresentationStyle.popover
        viewcontroller.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        self.present(viewcontroller, animated: animated, completion: completion)
    }
    
    
    
}
