//
//  Shapes.swift
//  Counting
//
//  Created by Waqar A. Malik on 2/15/15.
//  Copyright (c) 2015 Apress, Inc. All rights reserved.
//

import Foundation

enum ShapeType {
    case Circle
    case Triangle
    case Rectangle
    case Hexagon
}

enum ShapeColor {
    case Red
    case Blue
    case Green
}

struct ShapeRect {
    var x : Float
    var y : Float
    var width : Float
    var height : Float
}

struct Shape {
    var type : ShapeType
    var color : ShapeColor
    var bounds : ShapeRect
}

func shapes () {
    var shapes = [Shape]()
    shapes.append(Shape(type: .Circle, color: .Red, bounds: ShapeRect(x: 0, y: 0, width: 10, height: 20)))
    shapes.append(Shape(type: .Rectangle, color: .Blue, bounds: ShapeRect(x: 30, y: 40, width: 50, height: 60)))
    shapes.append(Shape(type: .Triangle, color: .Green, bounds: ShapeRect(x:10 , y: 20, width: 60, height: 80)))
    
    drawShapes(shapes)
}

func drawShapes(shapes : [Shape])
{
    for shape in shapes {
        switch shape.type {
        case .Circle:
            drawCircle(shape)
        case .Rectangle:
            drawRectangle(shape)
        case .Triangle:
            drawTriangle(shape)
        case .Hexagon:
            drawHexagon(shape)
        }
    }
}

func drawCircle(shape : Shape) {
    println("Drawing Circle")
}

func drawRectangle(shape : Shape) {
    println("Drawing Rectangle")
}

func drawTriangle(shape : Shape) {
    println("Drawing Triangle")
}

func drawHexagon(shape : Shape) {
    println("Drawing Hexagon")
}
