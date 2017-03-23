//
//  Person.swift
//  Chapter14
//
//  Created by Waqar A. Malik on 11/17/14.
//  Copyright (c) 2014 Apress, Inc. All rights reserved.
//

import Foundation

class Person
{
    let name : String
    init(name : String) {
        self.name = name
    }
    
    var automobile : Automobile3? = nil
    deinit {
        println("Person \(name) is being deinitialized")
    }
}