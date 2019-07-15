//
//  CountableTextField.swift
//  Sekke
//
//  Created by mahdi yousefpour on 12/24/17.
//  Copyright © 2017 BehPardakhtMellat. All rights reserved.
//

import UIKit

open  class MYsBaseCountableTextField: BaseTextField {

    public var buttonMines = UIButton()
    public var buttonPlus = UIButton()
    public var minNumber = 0
    public var maxNumber = 100
    
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
        self.font = UIFont.defaultFont()
        self.cornerRadius = self.height / 2
        
        self.clearButtonMode = UITextField.ViewMode.never
    }
    
    open func setButtons(){
        let frame = self.frame
        
        buttonMines = UIButton(frame: CGRect(x: 0, y: 0, width: frame.height, height: frame.height))
        buttonMines.addTarget(self, action: #selector(deCreaseValue), for: .touchUpInside)
        buttonMines.cornerRadius = buttonMines.height / 2
        buttonMines.setTitle("-", for: .normal)
        self.addSubview(buttonMines)
        
        buttonPlus = UIButton(frame: CGRect(x: frame.width - frame.height, y: 0, width: frame.height, height: frame.height))
        buttonPlus.addTarget(self, action: #selector(inCreaseValue), for: .touchUpInside)
        buttonPlus.cornerRadius = buttonPlus.height / 2
        buttonPlus.setTitle("+", for: .normal)
        self.addSubview(buttonPlus)
    }
    
    @objc open func inCreaseValue(){
        MYsUtilities.playSoundWhenTaped()
        if let str = self.text{
        self.text = (str.enNumber.ToInt() + 1).ToString()
        }
        if self.text!.ToInt() > maxNumber {
            self.text = (self.text!.ToInt() - 1).ToString()
        }
    }
    
    @objc open func deCreaseValue(){
        MYsUtilities.playSoundWhenTaped()
        if let str = self.text{
            self.text = (str.enNumber.ToInt() - 1).ToString()
        }
        
        if self.text!.ToInt() < minNumber {
            self.text = minNumber.ToString()
        }
    }
    
   open func checkLimitedNumber(){
        var num = self.text!.enNumber.ToInt()
        if num > self.maxNumber{
            num = self.maxNumber
        }
        if num < self.minNumber{
            num = self.minNumber
        }
        self.text = num.ToString()
    }

}
