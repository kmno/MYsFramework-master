//
//  MYsBaseObject.swift
//  LimagSwift
//
//  Created by Mahdi Yousefpour on 11/24/16.
//  Copyright © 2016 Mahdi Yousefpour. All rights reserved.
//

import UIKit
import CoreData

open class MYsBaseObject:NSObject {
    
}

public protocol MYsDataObjectProtocol {
    
    func save(input: Any)
    
    func edit(input: Any)
    
    func delete(input: Any)->Any?
    
    func deleteAll()
    
    func model(predicate:NSPredicate?)->Any?
    
    func models(predicate:NSPredicate?)->[Any]
    
}
