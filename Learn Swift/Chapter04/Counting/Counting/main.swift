//
//  main.swift
//  Counting
//
//  Created by Waqar A. Malik on 2/15/15.
//  Copyright (c) 2015 Apress, Inc. All rights reserved.
//

import Foundation

func counting1 () {
    println("Integers from 1 to 5")
    for i in 1...5 {
        println(i)
    }
}

func counting2 () {
    println("Integers from 1 to 10")
    for i in 1...10 {
        println(i)
    }
}

func counting3 () {
    let count : Int = 5
    println("Integers from 1 to \(count)")
    for i in 1...count {
        println(i)
    }
}

func counting4 (count : Int) {
    println("Integers from 1 to \(count)")
    for i in 1...count {
        println(i)
    }
}
//counting4(5)

drawMyShapes()