//
//  BaseViewController.swift
//  News
//
//  Created by hocluan on 11/9/16.
//  Copyright © 2016 hocluan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: Properties
    var jsondata: [String: AnyObject]?
    var news: [AnyObject] = []
    var CATEGORY_ID: Int!
    var apiURL: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
