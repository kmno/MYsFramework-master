//
//  MYsTimerManager.swift
//  MYsFrameWork
//
//  Created by Malihe on 10/10/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import Foundation


open class MYsTimer : NSObject{
    
    public var timer = Timer()
    public var seconds = 60 //This variable will hold a starting value of seconds. It could be any amount above 0.
    public var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    public var remainSecs = Int()
    public var remainMins = Int()
    public var remainHours = Int()
    public var remainDays = Int()
    public var remainMonths = Int()
    public var remainYears = Int()
    
    
    open func runTimer(target:UIViewController, timeInterval: TimeInterval,isRepeat:Bool,complition:@escaping ()->()) {
        self.timer = Timer.scheduledTimer(timeInterval: timeInterval, target: target, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: isRepeat)
        isTimerRunning = true
        complition()
    }
    
    @objc open func updateTimer(updateComplition:@escaping ()->(),finishComplition:@escaping ()->()) {
        if seconds == 0 {
            timer.invalidate()
            isTimerRunning = false
            finishComplition()
            return
        }
        seconds -= 1     //This will decrement(count down)the seconds.
        self.remainSecs = seconds % 60
        self.remainMins = seconds / 60
        self.remainHours = seconds / 3600
        self.remainDays = seconds / (3600 * 24)
        self.remainMonths = seconds / (3600 * 24 * 30)
        self.remainYears = seconds / (3600 * 24 * 365)
        updateComplition() //This will update the Method.
    }
    
}
