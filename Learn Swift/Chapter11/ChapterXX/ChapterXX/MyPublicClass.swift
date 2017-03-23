//
//  MyPublicClass.swift
//  ChapterXX
//
//  Created by Waqar A. Malik on 10/9/14.
//  Copyright (c) 2014 Crimson Research, Inc. All rights reserved.
//

import Foundation

public class MyPublicClass { // explicitly public
    public class MyInnerClass { // explicitly public
    }
    private(set) var myPublicProperty = 9 // implicitly internal
    public var myProperty = 7 // explicitly public
    internal var myInternalProperty = 8 // explicitly internal
    private var myPrivateProperty = 5 // explicitly private
    
    func myFunc1() { // implicitly public
    }
    
    public func myFunc2 () { // explicitly public
    }
    
    internal func myFunc3 () { // explicitly internal
    }
    
    private func myFunc4() { // explicitly private
    }
    private var array = [Int]()
    subscript(index : Int) -> Int {
        get {
            return array[index]
        }
        
        set (newValue) {
            array[index] = newValue
        }
    }
}

public class MyOtherClass : MyPublicClass {
    public override func myFunc3 () {
    }
    
    internal override func myFunc4() {
    }
}