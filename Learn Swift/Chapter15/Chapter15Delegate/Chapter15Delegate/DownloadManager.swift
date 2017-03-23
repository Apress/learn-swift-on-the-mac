//
//  DownloadManager.swift
//  Chapter15Delegate
//
//  Created by Waqar A. Malik on 12/1/14.
//  Copyright (c) 2014 Apress, Inc. All rights reserved.
//

import Foundation

public protocol MyProtocol : class {
    
}

public protocol MyProtocol1 : class, NSObjectProtocol {
    
}

public protocol DownloadManagerDelegate : NSObjectProtocol {
    func downloadManagerDidStart(manager : DownloadManager)
    func downloadManagerDidEnd(manager : DownloadManager)
}

public class DownloadManager
{
    lazy var operations : NSOperationQueue = {
        var queue = NSOperationQueue()
        queue.name = "com.apress.DownloadManager"
        queue.maxConcurrentOperationCount = 1
        return queue
        }()
    
    public weak var delegate : DownloadManagerDelegate?
    
    init() {
        println("init")
    }
    
    public func GET(path : String, parameters : [String : AnyObject]? = nil) {
        self.delegate?.downloadManagerDidStart(self)
        // do you work
        self.delegate?.downloadManagerDidEnd(self)
    }
}
