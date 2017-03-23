//
//  DetailViewController.swift
//  News
//
//  Created by Waqar A. Malik on 2/8/15.
//  Copyright (c) 2015 Apress, Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!

    var detailItem: Item? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: Item = self.detailItem {
            if let view = self.webView {
                let url = detail.url
                let urlRequest = NSURLRequest(URL: url!)
                view.loadRequest(urlRequest)
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

    func webViewDidFinishLoad(webView: UIWebView) {
        let title = webView.stringByEvaluatingJavaScriptFromString("document.title")
        self.title = title
    }
}

