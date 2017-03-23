//
//  OOPShapes.swift
//  Counting
//
//  Created by Waqar A. Malik on 2/15/15.
//  Copyright (c) 2015 Apress, Inc. All rights reserved.
//

import Foundation

class GeoShape {
    var color : ShapeColor
    var bounds : ShapeRect
    init (bounds : ShapeRect, color : ShapeColor) {
        self.bounds = bounds
        self.color = color
    }
    func draw() {
        println("Drawing basic shape")
    }
}
class Circle : GeoShape {
    override func draw () {
        println("Drawing Circle")
    }
}

class Rectangle : GeoShape {
    override func draw () {
        println("Drawing Rectangle")
    }
}

class Triangle : GeoShape {
    override func draw () {
        println("Drawing Triangle")
    }
}

class Hexagon : GeoShape {
    override func draw() {
        println("Drawing Hexagon")
    }
}

func drawShapes(shapes : [GeoShape]) {
    for shape in shapes {
        shape.draw()
    }
}

func drawMyShapes() {
    var shapes = [GeoShape]()
    shapes.append(Circle(bounds: ShapeRect(x: 0, y: 0, width: 10, height: 20), color: .Red))
    shapes.append(Rectangle(bounds: ShapeRect(x: 30, y: 40, width: 50, height: 60), color: .Blue))
    shapes.append(Triangle(bounds: ShapeRect(x:10 , y: 20, width: 60, height: 80), color: .Green))
    shapes.append(Hexagon(bounds: ShapeRect(x:10 , y: 20, width: 60, height: 80), color: .Red))
    drawShapes(shapes)
}