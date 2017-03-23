//
//  DetailViewController.swift
//  Car Collection
//
//  Created by Waqar A. Malik on 2/7/15.
//  Copyright (c) 2015 Apress, Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!

    var detailItem: Car? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: Car = self.detailItem {
            if let label = self.makeLabel {
                label.text = detail.make;
            }
            if let label = self.modelLabel {
                label.text = detail.model;
            }
            if let label = self.colorLabel {
                label.text = detail.color;
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

