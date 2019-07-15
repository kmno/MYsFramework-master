//
//  MYsNavigationBar.swift
//  MYsFrameWork
//
//  Created by Mahdi Yousefpour on 11/30/18.
//  Copyright © 2018 MYs. All rights reserved.
//

import Foundation

extension UINavigationBar {
    
    open func setGradientBackground(colors: [UIColor],start: CGPoint,end:CGPoint) {
        
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors,start:start,end:end)
        
        setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
    }
}
