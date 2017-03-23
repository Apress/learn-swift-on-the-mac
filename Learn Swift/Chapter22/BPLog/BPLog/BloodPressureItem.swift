//
//  BloodPressureItem.swift
//  BPLog
//
//  Created by Waqar A. Malik on 2/22/15.
//  Copyright (c) 2015 Apress, Inc. All rights reserved.
//

import Foundation
import HealthKit

class BloodPressureItem {
    private (set) var pressureSystolic : Double = 0.0
    private (set) var pressureDiastolic : Double = 0.0
    var startDate : NSDate = NSDate ()
    var endDate : NSDate = NSDate()
    
    required init(systolic : Double, pressureDiastolic diastolic : Double) {
        self.pressureSystolic = systolic
        self.pressureDiastolic = diastolic
    }
}

extension BloodPressureItem {
    convenience init(correlation : HKCorrelation) {
        let bloodPressureUnit: HKUnit = HKUnit.millimeterOfMercuryUnit()
        let bloodPressureSystolicType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodPressureSystolic)
        let bloodPressureDiastolicType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodPressureDiastolic)
        let systolicSet = correlation.objectsForType(bloodPressureSystolicType) as NSSet
        let diastolicSet = correlation.objectsForType(bloodPressureDiastolicType) as NSSet
        let bloodPressureSystolicSample = systolicSet.anyObject() as HKQuantitySample
        let bloodPressureDiastolicSample = diastolicSet.anyObject() as HKQuantitySample
        let systolicQuantity = bloodPressureSystolicSample.quantity
        let diastolicQuantity = bloodPressureDiastolicSample.quantity
        let systolic = systolicQuantity.doubleValueForUnit(bloodPressureUnit) as Double
        let diastolic = diastolicQuantity.doubleValueForUnit(bloodPressureUnit) as Double
        self.init(systolic: systolic, pressureDiastolic : diastolic)
        self.startDate = bloodPressureSystolicSample.startDate
        self.endDate = bloodPressureSystolicSample.endDate
    }
    
    func asCorrelation() -> HKCorrelation {
        let bloodPressureUnit: HKUnit = HKUnit.millimeterOfMercuryUnit()
        let bloodPressureSystolicQuantity: HKQuantity = HKQuantity(unit: bloodPressureUnit, doubleValue: self.pressureSystolic)
        let bloodPressureDiastolicQuantity: HKQuantity = HKQuantity(unit: bloodPressureUnit, doubleValue: self.pressureDiastolic)
        let bloodPressureSystolicType: HKQuantityType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodPressureSystolic)
        let bloodPressureDiastolicType: HKQuantityType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodPressureDiastolic)
        let startDate = self.startDate
        let endDate = self.endDate
        let bloodPressureSystolicSample: HKQuantitySample = HKQuantitySample(type: bloodPressureSystolicType, quantity: bloodPressureSystolicQuantity, startDate: startDate, endDate: endDate)
        let bloodPressureDiastolicSample: HKQuantitySample = HKQuantitySample(type: bloodPressureDiastolicType, quantity: bloodPressureDiastolicQuantity, startDate: startDate, endDate: endDate)
        var objects : NSSet = NSSet(objects: bloodPressureSystolicSample, bloodPressureDiastolicSample)
        var bloodPressureType: HKCorrelationType = HKObjectType.correlationTypeForIdentifier(HKCorrelationTypeIdentifierBloodPressure)
        var bloodPressureCorrelation : HKCorrelation = HKCorrelation(type: bloodPressureType, startDate: startDate, endDate: endDate, objects: objects)
        return bloodPressureCorrelation
    }
    
    var description : NSString {
        return "\(pressureSystolic) / \(pressureDiastolic)"
    }
}