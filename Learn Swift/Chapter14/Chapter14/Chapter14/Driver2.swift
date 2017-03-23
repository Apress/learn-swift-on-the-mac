//
//  Driver2.swift
//  Chapter14
//
//  Created by Waqar A. Malik on 11/17/14.
//  Copyright (c) 2014 Apress, Inc. All rights reserved.
//

import Foundation

class Driver2
{
    let name : String
    init(name : String) {
        self.name = name
    }
    
    weak var automobile : Automobile2? = nil
    deinit {
        println("Driver \(name) is being deinitialized")
    }
}