//
//  Car.swift
//  Car Collection
//
//  Created by Waqar A. Malik on 2/7/15.
//  Copyright (c) 2015 Apress, Inc. All rights reserved.
//

import Foundation
import CoreData

@objc(Car)
class Car: NSManagedObject {
    @NSManaged var color: String
    @NSManaged var doors: NSNumber
    @NSManaged var make: String
    @NSManaged var model: String
    @NSManaged var year: NSDate
}
