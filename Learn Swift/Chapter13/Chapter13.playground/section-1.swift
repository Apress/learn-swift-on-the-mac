// Playground - noun: a place where people can play

import Cocoa

extension Array {
    // your methods 
    mutating func removeFirst() -> T {
        let firstObject = self.removeAtIndex(0)
        return firstObject
    }
}

extension Int {
    mutating func doubleIt() {
        self = 2 * self
    }
}

var myint = Int(5)
myint.doubleIt()