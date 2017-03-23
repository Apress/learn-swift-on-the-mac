//
//  DetailEditorViewController.swift
//  Car Collection
//
//  Created by Waqar A. Malik on 2/7/15.
//  Copyright (c) 2015 Apress, Inc. All rights reserved.
//

import UIKit
import CoreData

class DetailEditorViewController: UIViewController {

    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var numberOfDoorsTextField: UITextField!
    @IBOutlet weak var makeYearDatePicker: UIDatePicker!
    
    var managedObjectContext: NSManagedObjectContext? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func cancel(sender: UIBarButtonItem) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        let context = self.managedObjectContext
        let entityName = "Car"
        let newCar = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context!) as Car
        newCar.make = self.makeTextField.text ?? "Unknown Make"
        newCar.model = self.modelTextField.text ?? "Unknown Model"
        newCar.color = self.colorTextField.text ?? "Unknown Color"
        let doors : NSString = self.numberOfDoorsTextField.text ?? "2"
        let number = NSNumber(int: doors.intValue)
        newCar.doors = number
        newCar.year = self.makeYearDatePicker.date
        
        var error: NSError? = nil
        if !context!.save(&error) {
        }

        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
