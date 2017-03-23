// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

struct Point {
    var x = 0.0
    var y = 0.0
}

class Engine {
    let numberOfCylinders : Int = 4
    
    init(numberOfCylinders: Int) {
        self.numberOfCylinders = numberOfCylinders
        println("init method executed")
    }
}

class Automobile {
    lazy var engine = Engine(numberOfCylinders: 6)
    var numberOfWheels = 4
}

var location = Point()
var smallEngine = Engine(numberOfCylinders: 3)

println(smallEngine.numberOfCylinders)
println(location.x)

//smallEngine.numberOfCylinders = 5
location.x = 10
location.y = 30

var car = Automobile()
//car.engine.numberOfCylinders = 6

var anotherLocation = location
location.x = 20
location.y = 50

println(location.x)
println(anotherLocation.x)

let myCar = car
//car.engine.numberOfCylinders = 10
println(myCar.engine.numberOfCylinders)
myCar.numberOfWheels = 6

if myCar === car {
    println("Both myCar and car are the same instance of the Car")
}

class Automobile2 {
    class Engine {
        var numberOfCylinders : Int = 0 {
            willSet(cylinderCount) {
                println("about to set the cylinder count \(cylinderCount)")
            }
            didSet {
                println("engine had \(oldValue) cylinders")
                println("engine now has \(self.numberOfCylinders) cylinders")
            }
        }
        class var manufacturer : String {
            return "Porsche"
        }
        
        var start : Bool = false
        init(numberOfCylinders: Int) {
            self.numberOfCylinders = numberOfCylinders
        }
    }
    let engine : Engine
    let numberOfWheels : Int
    
    var start : Bool {
        get {
            return self.engine.start
        }
        set {
            self.engine.start = newValue
        }
    }
    init (numberOfCylinders : Int, numberOfWheels : Int) {
        engine = Engine(numberOfCylinders: numberOfCylinders)
        self.numberOfWheels = numberOfWheels;
    }
}

var fastCar = Automobile2(numberOfCylinders: 4, numberOfWheels: 4)
fastCar.engine.numberOfCylinders = 6
println("Car start \(fastCar.start)")
fastCar.start = true
println("Car start \(fastCar.start)")


let theEngine = Automobile2.Engine(numberOfCylinders: 4)
