//
//  DetailViewController.swift
//  Blog_reader
//
//  Created by Wan Kim Mok on 2/28/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet var webview: UIWebView!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let postWebview = self.webview {
                
                postWebview.loadHTMLString(detail.valueForKey("content")!.description, baseURL: NSURL(string: "https://googleblog.blogspot.com/"))
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

