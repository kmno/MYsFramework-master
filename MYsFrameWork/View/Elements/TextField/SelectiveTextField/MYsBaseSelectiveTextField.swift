//
//  MYsSelectiveTextField.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 3/27/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsBaseSelectiveTextField: BaseTextField {
    
    public var btnSelectiveLeft = UIButton()
    public var btnSelectiveRight = UIButton()
    public var itemTitle = ""
    public var itemId = ""
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initial()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initial()
    }
    
    override open  func initial() {
        super.initial()
        self.borderWidth = 0
        self.placeholder = "----"
        self.keyboardType = .numberPad
        self.textAlignment = .center
        self.font = UIFont.defaultFont()
        self.cornerRadius = self.height / 2
        
        self.clearButtonMode = UITextField.ViewMode.never
    }
    
    open func setButtons(){
        let frame = self.frame
        
//        btnSelectiveLeft = UIButton(frame: CGRect(x: 0, y: 0, width: frame.height, height: frame.height))
//        btnSelectiveLeft.addTarget(self, action: #selector(selectItem), for: .touchUpInside)
//        btnSelectiveLeft.cornerRadius = btnSelectiveLeft.height / 2
//        btnSelectiveLeft.setTitle("", for: .normal)
//        self.addSubview(btnSelectiveLeft)
//        
//        btnSelectiveRight = UIButton(frame: CGRect(x: frame.width - frame.height, y: 0, width: frame.height, height: frame.height))
//        btnSelectiveRight.addTarget(self, action: #selector(selectItem), for: .touchUpInside)
//        btnSelectiveRight.cornerRadius = btnSelectiveRight.height / 2
//        btnSelectiveRight.setTitle("", for: .normal)
//        self.addSubview(btnSelectiveRight)
        
        btnSelectiveLeft = UIButton(frame: CGRect(x:  (-(frame.height / 7)), y: 0, width: frame.height - 2, height: frame.height - 2))
        btnSelectiveLeft.addTarget(self, action: #selector(selectItem), for: .touchUpInside)
        btnSelectiveLeft.cornerRadius = btnSelectiveLeft.height / 2
        btnSelectiveLeft.setTitle("", for: .normal)
        self.addSubview(btnSelectiveLeft)
        
        MYsUtilities.delay(0.4) {
            self.btnSelectiveRight = UIButton(frame: CGRect(x: frame.width + (frame.height / 4), y: 0, width: frame.height - 2, height: frame.height - 2))
            self.btnSelectiveRight.addTarget(self, action: #selector(self.selectItem), for: .touchUpInside)
            self.btnSelectiveRight.cornerRadius = self.btnSelectiveRight.height / 2
            self.btnSelectiveRight.setTitle("", for: .normal)
            self.addSubview(self.btnSelectiveRight)
        }
        
        self.isRtl(isRtl: self.semanticContentAttribute == .forceRightToLeft ? false : true)
        self.clipsToBounds = false
        self.cornerRadius = self.height / 2
    }
    
    @objc open func selectItem(){
        MYsUtilities.playSoundWhenTaped()
        doneCompletionHandler()
    }
    
    open func isRtl(isRtl:Bool){
        if isRtl {
            self.btnSelectiveRight.isHidden = true
        }else{
            self.btnSelectiveLeft.isHidden = true
        }
    }

}
