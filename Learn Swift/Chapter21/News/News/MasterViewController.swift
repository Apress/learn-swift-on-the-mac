//
//  MasterViewController.swift
//  News
//
//  Created by Waqar A. Malik on 2/8/15.
//  Copyright (c) 2015 Apress, Inc. All rights reserved.
//

import UIKit

let NetworkManagerBaseURL = "http://hacker-news.firebaseio.com"

class MasterViewController: UITableViewController {

    var objects = NSMutableArray()


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.navigationItem.leftBarButtonItem = self.editButtonItem()
//
//        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
//        self.navigationItem.rightBarButtonItem = addButton
        
        self.getTopStories()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        objects.insertObject(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = objects[indexPath.row] as NSNumber
                let item = stories[object] as Item
                (segue.destinationViewController as DetailViewController).detailItem = item
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

        let object = objects[indexPath.row] as NSNumber
        let item = self.stories[object] as Item
        cell.textLabel!.text = item.title
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

    var operationQueue : NSOperationQueue = {
        var operationQueue = NSOperationQueue()
        operationQueue.name = "com.apress.DownloadQueue"
        operationQueue.maxConcurrentOperationCount = 1
        return operationQueue
    }()
    
    private func getTopStories() -> Void {
        let url = NSURL(string: NetworkManagerBaseURL + "/v0/topstories.json")
        var urlRequest = NSMutableURLRequest(URL: url!)
        urlRequest.HTTPMethod = "GET"
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: self.operationQueue) {[unowned self] (response, responseData, error) -> Void in
            println(response)
            if let data = responseData {
                let objects = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil) as? NSArray
                if let stories = objects {
                    self.downloadStoriesInformation(stories)
                }
            }
        }
    }
    
    var stories = NSMutableDictionary()
    
    private func downloadStoriesInformation (storyIdentifiers : NSArray) -> Void {
        var downloaded : Int = 0
        let count = storyIdentifiers.count
        self.stories.removeAllObjects()
        for var index : Int = 0; index < count; index++ {
            let storyIdentifier = storyIdentifiers[index] as NSNumber
            let urlString = NetworkManagerBaseURL + "/v0/item/" + storyIdentifier.stringValue + ".json"
            let url = NSURL(string: urlString)
            var urlRequest = NSMutableURLRequest(URL: url!)
            urlRequest.HTTPMethod = "GET"
            NSURLConnection.sendAsynchronousRequest(urlRequest, queue: self.operationQueue) {[unowned self] (response, responseData, error) -> Void in
                if let data = responseData {
                    let object = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil) as? NSDictionary
                    let item = Item(dictionary: object as [String : AnyObject])
                    self.stories.setObject(item, forKey: storyIdentifier)
                    downloaded++
                    if downloaded == count {
                        self.objects.removeAllObjects()
                        self.objects.addObjectsFromArray(storyIdentifiers)
                        dispatch_async(dispatch_get_main_queue()) { [unowned self] in
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
}

