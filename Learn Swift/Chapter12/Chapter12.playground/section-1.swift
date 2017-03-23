// Playground - noun: a place where people can play

import UIKit

class Shape {
    var fillColor : UIColor
    var bounds : CGRect
    
    init(bounds : CGRect, fillColor : UIColor) {
        self.bounds = bounds
        self.fillColor = fillColor
    }
    
    func draw () {
        println("We don't know how to draw this shape.")
    }
}

var shape = Shape(bounds: CGRectZero, fillColor: UIColor.redColor())
shape.draw()

class Circle: Shape {
    override var fillColor : UIColor {
        didSet {
            println("the new color is \(self.fillColor)")
        }
    }
    override var bounds : CGRect {
        get {
            return super.bounds
        }
        set (newBounds) {
            super.bounds = CGRectInset(newBounds, 5, 5)
        }
    }
    
    override func draw() {
        println("Drawing a circle in a bounding box \(NSStringFromCGRect(self.bounds)) and color \(self.fillColor.description)")
    }
}

shape = Circle(bounds: CGRectMake(0.0, 0.0, 30.0, 30.0), fillColor: UIColor.blueColor())
shape.bounds = CGRectMake(0, 0, 50, 50)
shape.fillColor = UIColor.redColor()
shape.draw()


final class Polygon : Shape {
    var numberOfSides : Int = 3
    override func draw() {
        if numberOfSides == 0 {
            super.draw()
        } else {
            println("Drawing a polygone with \(numberOfSides) sides in a bounding box \(NSStringFromCGRect(self.bounds)) and color \(self.fillColor.description)")
        }
    }
}

shape = Polygon(bounds: CGRectMake(0.0, 0.0, 30.0, 30.0), fillColor: UIColor.blueColor())
shape.draw()

let π = 3.141
extension Circle {
    var radius : Double {
        let width = Double(self.bounds.size.width)
        return width / 2.0
    }
    
    var area : Double {
        let radius = self.radius
        return (π * radius * radius)
    }
}
