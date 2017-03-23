//
//  ViewController.swift
//  ChapterXX
//
//  Created by Waqar A. Malik on 10/9/14.
//  Copyright (c) 2014 Crimson Research, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var mypublicClass = MyPublicClass()
        mypublicClass[0] = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

