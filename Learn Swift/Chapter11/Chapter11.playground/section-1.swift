// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

public class MyPublicClass {
    private class MyInnerClass {
        func myInnterFunction() {
            println("Inner Function")
        }
    }
    func myFunction() {
        println("myFunction")
        myInnerClass.myInnterFunction()
    }
    
    private var myInnerClass = MyInnerClass()
}

var myPublicClass = MyPublicClass()
myPublicClass.myFunction()
var myClass = MyPublicClass.MyInnerClass()
