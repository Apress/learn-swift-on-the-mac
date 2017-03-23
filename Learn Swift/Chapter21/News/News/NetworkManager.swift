//
//  NetworkManager.swift
//  News
//
//  Created by Waqar A. Malik on 2/8/15.
//  Copyright (c) 2015 Apress, Inc. All rights reserved.
//

import Foundation

//public typealias NetworkManagerCompletion = (result : AnyObject?, error : NSError?) -> Void
//
//public class NetworkManager  {
//    class var sharedInstance : NetworkManager {
//        struct Singleton {
//            static var configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
//            configuration.HTTPAdditionalHeaders = ["Content-Type" : "application/json"]
//            static let networkManager = NetworkManager(configuration : configuration)
//        }
//
//        return Singleton.networkManager
//    }
// 
//    public let session : NSURLSession
//    required public init(configuration : NSURLSessionConfiguration? = nil) {
//        self.session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
//    }
//    
//    public func getTopStories(completion : NetworkManagerCompletion?) -> Void {
//        
//    }
//}