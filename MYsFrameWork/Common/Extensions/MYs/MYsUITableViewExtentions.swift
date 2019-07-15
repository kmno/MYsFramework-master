//
//  File.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 4/11/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import Foundation


extension UITableView {
    
    open func register(nibName: String, identifier: String){
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    open func cellforRow(row:Int,section:Int)-> UITableViewCell?{
        return self.cellForRow(at: IndexPath(row: row, section: section))
    }
    
}
