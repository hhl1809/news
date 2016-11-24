//
//  ArticleTypeViewController4.swift
//  News
//
//  Created by hocluan on 11/6/16.
//  Copyright © 2016 hocluan. All rights reserved.
//

import UIKit

class ArticleTypeViewController4: ArticleViewController, UIWebViewDelegate {
    
    // MARK: Outlets
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func loadData() {
        super.loadData()
        let urlString = (field?["share_url"] as! String) + "?view=app"
        let url = URL(string: urlString)
        webView.loadRequest(URLRequest(url: url!))
    }

    
}
