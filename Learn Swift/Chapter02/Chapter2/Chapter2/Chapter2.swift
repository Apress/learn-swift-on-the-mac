//
//  Chapter2.swift
//  Chapter2
//
//  Created by Waqar A. Malik on 8/24/14.
//  Copyright (c) 2014 Apress Media. All rights reserved.
//

import Foundation

public class Chapter2
{
    var message : String
    public init(_ message : String)
    {
        self.message = message
    }
    
    public func printMessage()
    {
        println(message)
    }
}
