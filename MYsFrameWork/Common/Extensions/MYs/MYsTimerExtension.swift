//
//  MYsTimerExtension.swift
//  MYsFrameWork
//
//  Created by Mahdi Yousefpour on 8/14/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import Foundation

extension Timer{
    
    public var isPaused: Bool {
        get{return self.isPaused }
        set{ self.isPaused = newValue}
    }
    
    public var isBackgroundMode: Bool {
        get{return self.isBackgroundMode }
        set{ self.isBackgroundMode = newValue}
    }
    
}
