//
//  HomeViewController.swift
//  News
//
//  Created by hocluan on 11/3/16.
//  Copyright © 2016 hocluan. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Show left Menu
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        // Configure table view
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(UINib(nibName: "DefaultNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "idDefaultNewsTableViewCell")
        homeTableView.rowHeight = UITableViewAutomaticDimension
        homeTableView.estimatedRowHeight = 90
        
        // Get data from API URL
        apiURL = URL(string:"http://api3.vnexpress.net/api/mobile?type=home&device=mobile&step=1&app_id=c31b32")
        
        URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            DispatchQueue.main.async {
                print("Connected")
                self.jsondata = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: AnyObject]
                let data1 = self.jsondata?["data"]
                let data2 = data1?["top"]
                self.news = (data2 as! [AnyObject]?)!
                
                self.homeTableView.reloadData()
            }
        }.resume()
        self.homeTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.news.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idDefaultNewsTableViewCell", for: indexPath) as! DefaultNewsTableViewCell
        let data = self.news[indexPath.row] as! [String: AnyObject]
        
        // Configure the cell...
        cell.titleNews.text = data["title"] as? String
        cell.imageNews.image = UIImage(data: (NSData(contentsOf: (NSURL(string: (data["thumbnail_url"] as? String)!) as? URL)!) as? Data)!)
        let comments = data["total_comment"] as! Int
        let date = NSDate(timeIntervalSince1970: data["publish_time"] as! Double)
        let timePublish = DateFormatter()
        timePublish.dateFormat = "hh:mm - dd/MM"
        cell.totalComment.text = "\(comments)"
        cell.publishTime.text = "\(timePublish.string(from: date as Date))"
        cell.articleType = data["article_type"] as! Int
        cell.articleID = data["article_id"] as! Int

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var storyBoardName: String!
        var storyBoardIdentifier: String!
        
        let cell = tableView.cellForRow(at: indexPath) as! DefaultNewsTableViewCell
        tableView.deselectRow(at: indexPath, animated: true)
        
        // test type 4
        cell.articleType = 4
        
        if cell.articleType == 1 {
            storyBoardName = "ArticleType1"
            storyBoardIdentifier = "idArticleType1"
            
        } else if cell.articleType == 2 {
            storyBoardName = "ArticleType2"
            storyBoardIdentifier = "idArticleType2"
            
        } else if cell.articleType == 3 {
            storyBoardName = "ArticleType3"
            storyBoardIdentifier = "idArticleType3"
    
        } else if cell.articleType == 4 {
            storyBoardName = "ArticleType4"
            storyBoardIdentifier = "idArticleType4"
            
        } else {
            storyBoardName = "ArticleType5"
            storyBoardIdentifier = "idArticleType5"
        }
        
        let storyBoard : UIStoryboard = UIStoryboard(name: storyBoardName, bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: storyBoardIdentifier) as! ArticleViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
        // Send data to nextViewController
//        nextViewController.articleType = cell.articleType
//        nextViewController.articleID = cell.articleID
        
        nextViewController.articleType = 4
        nextViewController.articleID = 3493125
    }
    
}
