//
//  ViewController.swift
//  Chapter15Delegate
//
//  Created by Waqar A. Malik on 12/1/14.
//  Copyright (c) 2014 Apress, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DownloadManagerDelegate
{
    private var downloadManager : DownloadManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.downloadManager = DownloadManager()
        self.downloadManager?.delegate = self
    
        self.downloadManager?.GET("/articles")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func downloadManagerDidStart(manager: DownloadManager) {
        println("Download did Start")
    }
    
    func downloadManagerDidEnd(manager: DownloadManager) {
        println("Download did finish")
    }
}

