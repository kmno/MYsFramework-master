//
//  MYsCAGradientLayer.swift
//  MYsFrameWork
//
//  Created by Mahdi Yousefpour on 11/30/18.
//  Copyright © 2018 MYs. All rights reserved.
//

import Foundation

extension CAGradientLayer {
    
    convenience init(frame: CGRect, colors: [UIColor],start: CGPoint,end:CGPoint) {
        self.init()
        self.frame = frame
        self.colors = []
        for color in colors {
            self.colors?.append(color.cgColor)
        }
        startPoint = start
        endPoint = end
    }
    
    public func createGradientImage() -> UIImage? {
        
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
    
}
