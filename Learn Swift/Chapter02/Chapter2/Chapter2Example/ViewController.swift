//
//  ViewController.swift
//  Chapter2Example
//
//  Created by Waqar A. Malik on 8/24/14.
//  Copyright (c) 2014 Apress Media. All rights reserved.
//

import UIKit
import Chapter2

class ViewController: UIViewController {
    
    var helloFramework : Chapter2
    
    required init(coder aDecoder: NSCoder) {
        self.helloFramework = Chapter2("Hello, framework")
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.helloFramework.printMessage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

