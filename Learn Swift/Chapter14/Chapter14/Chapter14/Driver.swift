//
//  Driver.swift
//  Chapter14
//
//  Created by Waqar A. Malik on 11/16/14.
//  Copyright (c) 2014 Apress, Inc. All rights reserved.
//

import Foundation

class Driver
{
    let name : String
    init(name : String) {
        self.name = name
    }
    
    var automobile : Automobile? = nil
    deinit {
        println("Driver \(name) is being deinitialized")
    }
}