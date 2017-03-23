//
//  main.swift
//  Chapter14
//
//  Created by Waqar A. Malik on 11/16/14.
//  Copyright (c) 2014 Apress, Inc. All rights reserved.
//

import Foundation

class Student
{
    let name : String
    init(name : String) {
        self.name = name;
        println("Student \(self.name) is being initialized")
    }
    
    deinit {
        println("Student \(self.name) is being deinitialized")
    }
}

var student : Student? = Student(name: "Adam Malik")
var student1 : Student? = student
var student2 : Student? = student
student = nil
student1 = nil
student2 = nil

var mario : Driver? = Driver(name: "Mario Andretti")
var ferrari : Automobile? = Automobile(name: "Ferrari")

mario!.automobile = ferrari
ferrari!.driver = mario

var vettel : Driver2? = Driver2(name: "Sebastian Vettel")
var renault : Automobile2? = Automobile2(name: "Renault")
vettel?.automobile = renault
renault?.driver = vettel

renault = nil
vettel = nil

var waqar : Person? = Person(name : "Waqar Malik")
var vw : Automobile3? = Automobile3(name: "Volkswagen", owner: waqar!)
waqar?.automobile = vw

var information = vw?.information
vw = nil
