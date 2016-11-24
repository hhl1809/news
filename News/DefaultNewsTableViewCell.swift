//
//  DefaultNewsTableViewCell.swift
//  News
//
//  Created by hocluan on 11/3/16.
//  Copyright © 2016 hocluan. All rights reserved.
//

import UIKit

class DefaultNewsTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var totalComment: UILabel!
    @IBOutlet weak var publishTime: UILabel!
    
    // MARK: Properties
    var articleType: Int!
    var articleID: Int!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
