//
//  main.swift
//  Automobile
//
//  Created by Waqar A. Malik on 10/1/14.
//  Copyright (c) 2014 Crimson Research, Inc. All rights reserved.
//

import Foundation

class Engine {
    let numberOfCylinders : Int = 4
    init (numberOfCylinders : Int) {
        self.numberOfCylinders = numberOfCylinders
        println("Engine Init function Called \(self.numberOfCylinders)")
    }
}

class Automobile {
    var engine = Engine(numberOfCylinders: 4)
    var numberOfWheels : Int = 4
}

class Automobile2 {
    lazy var engine = Engine(numberOfCylinders : 6)
    var numberOfWheels : Int = 4
}

func crate () {
    var car1 = Automobile()
    var car2 = Automobile2()
}

crate()
