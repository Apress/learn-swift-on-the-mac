//
//  Item.swift
//  News
//
//  Created by Waqar A. Malik on 2/8/15.
//  Copyright (c) 2015 Apress, Inc. All rights reserved.
//

import Foundation

public class Item {
    let identifier : Int
    
    required public init(dictionary : [String : AnyObject]) {
        let identifier = dictionary["id"] as NSNumber
        self.identifier = Int(identifier.intValue)
        self.score = 0
        self.update(dictionary)
    }
    
    var type : String? = nil
    var by : String? = nil
    var date : NSDate? = nil
    var title : String? = nil
    var url : NSURL? = nil
    var score : Int32
    var text : String? = nil
    
    public func update(dictionary : [String : AnyObject]) {
        self.type = dictionary["type"] as? String
        self.by = dictionary["by"] as? String
        
        let unixTime = dictionary["time"] as? NSNumber
        if let time : NSNumber = unixTime {
            self.date = NSDate(timeIntervalSince1970 : time.doubleValue) as NSDate
        }
        self.title = dictionary["title"] as? String
        
        let urlString = dictionary["url"] as? String
        if let string = urlString {
            self.url = NSURL(string: string)
        }
        let score = dictionary["score"] as? NSNumber
        if let value : NSNumber = score {
            self.score = Int32(value.intValue)
        }
        self.text = dictionary["text"] as? String
    }
}
