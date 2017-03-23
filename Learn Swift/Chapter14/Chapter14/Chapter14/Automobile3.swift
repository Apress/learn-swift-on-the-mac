//
//  Automobile3.swift
//  Chapter14
//
//  Created by Waqar A. Malik on 11/17/14.
//  Copyright (c) 2014 Apress, Inc. All rights reserved.
//

import Foundation

class Automobile3
{
    let name : String
    init(name: String, owner: Person) {
        self.name = name
        self.owner = owner
    }
    
    lazy var information : () -> String = {
        [unowned self] in
        if let driver = self.driver {
            return "Car \(self.name) is owned by \(self.owner) and driven by \(driver)"
        } else {
            return "Car \(self.name) is owned by \(self.owner) and driven by \(self.owner)"
        }
    }
    
    weak var driver : Person? = nil
    unowned var owner : Person
    deinit {
        println("Automobile \(name) is being deinitialized")
    }
}