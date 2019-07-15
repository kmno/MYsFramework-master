//
//  MYsImageViewObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 7/9/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsImageViewObject: NSObject {
    
}

extension UIImageView{
    
    public func setImage(image : UIImage?){
        if image == nil{
            self.image = UIImage()
        }
        self.image = image
    }
    
    public func setImage(name : String){
        if image == nil{
            self.image = UIImage()
        }
        self.image = UIImage(named: name)
    }
}
