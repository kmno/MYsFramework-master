//
//  MYsNumberTextField.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 1/16/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsBaseNumberTextField: BaseTextField {

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initial()
    }
    
    override public  init(frame: CGRect) {
        super.init(frame: frame)
        initial()
    }
    
    override open func initial() {
        super.initial()
        self.keyboardType = .numberPad
    }
    
    
}
