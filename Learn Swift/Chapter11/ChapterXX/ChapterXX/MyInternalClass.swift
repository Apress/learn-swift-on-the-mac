//
//  MyInternalClass.swift
//  ChapterXX
//
//  Created by Waqar A. Malik on 10/9/14.
//  Copyright (c) 2014 Crimson Research, Inc. All rights reserved.
//

import Foundation

class MyInternalClass // explicitly internal
{
    var myInternalProperty = 0  // implicitly internal
    internal var myOtherInternalProperty = 5 // explicitly internal
    private var myPrivateProperty = 4 // explicitly private
    
    func MyInternalMethod() { // implicitly internal
    }
    
    private func MyPrivateFunction () { // explicitly private
    }
}