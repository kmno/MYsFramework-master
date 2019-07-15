//
//  MYsDateLable.swift
//  Abotorab
//
//  Created by Mahdi Yousefpour on 7/22/16.
//  Copyright © 2016 Mahdi Yousefpour. All rights reserved.
//

import UIKit

open class MYsDateLable: UILabel {
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.font = UIFont.fontWithSize(size: 13)
        
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont.fontWithSize(size: 13)
    }
    
}
