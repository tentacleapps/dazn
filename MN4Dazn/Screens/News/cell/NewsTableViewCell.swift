//
//  NewsTableViewCell.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 19/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imv: UIImageView!
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupWith(item: NewsViewModel){
        descLabel.text =  item.title
        dateLabel.text =  item.date
        guard let imageString = item.image else {
            return
        }
        let url = URL(string: imageString)
        imv.sd_setImage(with: url, completed: nil)
    }

}
