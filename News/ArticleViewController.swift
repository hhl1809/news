//
//  ArticleViewController.swift
//  News
//
//  Created by hocluan on 11/7/16.
//  Copyright © 2016 hocluan. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    
    // MARK: Properties
    var articleType: Int!
    var articleID: Int!
    var jsondata: [String: AnyObject]?
    var field: [String: AnyObject]?
    
    func loadData() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Get data from API URL
        let apiURL = URL(string:"http://api3.vnexpress.net/api/article?type=get_full&option=tag_detail,list_reference,author_article,cate_parent,mode_view,object,topic_article&app_id=c31b32&article_id=\(articleID!)&page=1")
        
        URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            DispatchQueue.main.async {
                print("Connected")
                self.jsondata = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: AnyObject]
                self.field = self.jsondata?["data"] as? [String : AnyObject]
                self.loadData()
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
