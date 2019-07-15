//
//  MYsTabbarObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 6/27/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

public class MYsTabbarObject: NSObject {

    static public func setTabBarVisible(_ viewController:UIViewController,visible:Bool, animated:Bool) {
        
        //* This cannot be called before viewDidLayoutSubviews(), because the frame is not set before this time
        
        // bail if the current state matches the desired state
        if (MYsTabbarObject.tabBarIsVisible(viewController) == visible) { return }
        
        // get a frame calculation ready
        let frame = viewController.tabBarController?.tabBar.frame
        let height = frame?.size.height
        let offsetY = (visible ? -height! : height)
        
        // zero duration means no animation
        let duration:TimeInterval = (animated ? 0.3 : 0.0)
        
        //  animate the tabBar
        if frame != nil {
            UIView.animate(withDuration: duration) {
                viewController.tabBarController?.tabBar.frame = frame!.offsetBy(dx: 0, dy: offsetY!)
                return
            }
        }
    }
    
    static public func tabBarIsVisible(_ viewController:UIViewController) ->Bool {
        return (viewController.tabBarController?.tabBar.frame.origin.y)! < viewController.view.frame.maxY
    }
}
