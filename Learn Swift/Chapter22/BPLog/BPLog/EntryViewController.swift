//
//  EntryViewController.swift
//  BPLog
//
//  Created by Waqar A. Malik on 2/22/15.
//  Copyright (c) 2015 Apress, Inc. All rights reserved.
//

import UIKit

protocol EntryViewControllerDelegate {
    func entryViewControllerDidCancel(viewController : EntryViewController)
    func entryViewControllerDidSave(viewController : EntryViewController)
}

class EntryViewController: UIViewController {

    var delegate : EntryViewControllerDelegate? = nil
    
    @IBOutlet weak var systolicTextField: UITextField!
    @IBOutlet weak var diastolicTextField: UITextField!
    
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

    func bloodPressureValues() -> (systolic : Double, diastolic : Double) {
        let systolicString = systolicTextField.text as NSString?
        let diastolicString = diastolicTextField.text as NSString?
        var systolic = 0.0
        var diastolic = 0.0
        if let systolicValue = systolicString {
            systolic = systolicValue.doubleValue
        }
        if let diastolicValue = diastolicString {
            diastolic = diastolicValue.doubleValue
        }
        return (systolic, diastolic)
    }

    @IBAction func cancel(sender: UIButton) {
        self.delegate?.entryViewControllerDidCancel(self)
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func save(sender: UIButton) {
        self.delegate?.entryViewControllerDidSave(self)
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
