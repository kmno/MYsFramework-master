//
//  MYsCollectionViewExtension.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 4/14/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    open func register(nibName: String, identifier: String){
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
    open func cellforItem(row:Int,section:Int)-> UICollectionViewCell?{
        return self.cellForItem(at: IndexPath(row: row, section: section))
    }
}
