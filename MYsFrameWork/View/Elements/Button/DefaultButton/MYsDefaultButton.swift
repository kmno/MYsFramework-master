//
//  MYsDefaultButton.swift
//  Abotorab
//
//  Created by Mahdi Yousefpour on 7/22/16.
//  Copyright © 2016 Mahdi Yousefpour. All rights reserved.
//

import UIKit

open class MYsBaseDefaultButton: MYsBaseButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.titleLabel!.font = UIFont.fontWithSize(size: 15)
    }
    
    override public  init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel!.font = UIFont.fontWithSize(size: 15)
    }

}
