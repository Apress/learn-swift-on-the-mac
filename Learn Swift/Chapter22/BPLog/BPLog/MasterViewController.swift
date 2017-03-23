//
//  MasterViewController.swift
//  BPLog
//
//  Created by Waqar A. Malik on 2/22/15.
//  Copyright (c) 2015 Apress, Inc. All rights reserved.
//

import UIKit
import HealthKit

class MasterViewController: UITableViewController, EntryViewControllerDelegate {

    var objects = NSMutableArray()
    var healthStore : HKHealthStore? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        
        let healthDataAvailable = HKHealthStore.isHealthDataAvailable()
        if healthDataAvailable {
            self.requestAuthorizationAndLoadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("entryViewController") as EntryViewController
        viewController.delegate = self
        self.navigationController?.presentViewController(viewController, animated: true, completion: nil)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = objects[indexPath.row] as BloodPressureItem
            (segue.destinationViewController as DetailViewController).detailItem = object
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let item = self.objects.objectAtIndex(indexPath.row) as BloodPressureItem
        cell.textLabel!.text = String("\(item.pressureSystolic)/\(item.pressureDiastolic)")
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    private func readDataTypes() -> NSSet {
        let heightType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)
        let weightType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
        let heartRateType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeartRate)
        let bloodPressureSystolic = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodPressureSystolic)
        let bloodPressureDiastolic = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodPressureDiastolic)
        let birthDayType = HKCharacteristicType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierDateOfBirth)
        let biologicalSexType = HKCharacteristicType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBiologicalSex);
        return NSSet(objects: heightType, weightType, heartRateType, bloodPressureSystolic, bloodPressureDiastolic, birthDayType, biologicalSexType)
    }
    
    private func writeDataTypes() -> NSSet {
        let heightType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)
        let weightType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
        let heartRateType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeartRate)
        let bloodPressureSystolic = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodPressureSystolic)
        let bloodPressureDiastolic = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodPressureDiastolic)
        return NSSet(objects: heightType, weightType, heartRateType, bloodPressureSystolic, bloodPressureDiastolic)
    }
    
    private func requestAuthorizationAndLoadData() {
        self.healthStore = HKHealthStore()
        let readDataTypes = self.readDataTypes()
        let writeDataTypes = self.writeDataTypes()
        self.healthStore?.requestAuthorizationToShareTypes(writeDataTypes, readTypes: readDataTypes, completion: { [unowned self] (success, error) -> Void in
            if success {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.loadData()
                })
            } else {
                println("You did not allow health store access")
            }
        })
    }
    
    private func loadData() {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let dateComponents = calendar.components(NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay, fromDate:now)
        let startDate = calendar.dateFromComponents(dateComponents)
        
        let endDate = calendar.dateByAddingUnit(NSCalendarUnit.CalendarUnitDay, value: 7, toDate: startDate!, options:NSCalendarOptions(rawValue: 0))
        let bloodPressure = HKCorrelationType.correlationTypeForIdentifier(HKCorrelationTypeIdentifierBloodPressure)
        let predicate = HKQuery.predicateForSamplesWithStartDate(startDate, endDate: endDate, options: .None)
        let sampleQuery = HKSampleQuery(sampleType: bloodPressure as HKSampleType, predicate: predicate, limit: 0, sortDescriptors: nil) { [unowned self](query, bloodPressureResults, error) -> Void in
            if let results = bloodPressureResults {
                self.objects.removeAllObjects()
                for var index = 0; index < results.count; index++ {
                    let bpitem = results[index] as HKCorrelation
                    let item = BloodPressureItem(correlation: bpitem)
                    self.objects.addObject(item)
                }
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        }
        self.healthStore?.executeQuery(sampleQuery)
    }
    
    // MARK: - EntryViewControllerDelegate
    func entryViewControllerDidSave(viewController: EntryViewController) {
        let values = viewController.bloodPressureValues()
        let bloodPressureItem = BloodPressureItem(systolic: values.systolic, pressureDiastolic: values.diastolic)
        let bloodPressureCorrelation = bloodPressureItem.asCorrelation()
        self.healthStore!.saveObject(bloodPressureCorrelation, withCompletion: { [unowned self] (success, error) -> Void in
            if success {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let indexPath = NSIndexPath(forRow: self.objects.count, inSection: 0)
                    self.objects.addObject(bloodPressureItem)
                    self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                })
            }
        })
    }
    
    func entryViewControllerDidCancel(viewController: EntryViewController) {
    }
}

