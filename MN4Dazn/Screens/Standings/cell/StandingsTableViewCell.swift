//
//  StandingsTableViewCell.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 20/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import UIKit

class StandingsTableViewCell: UITableViewCell {
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var team: UILabel!
    @IBOutlet weak var played: UILabel!
    @IBOutlet weak var wid: UILabel!
    @IBOutlet weak var draw: UILabel!
    @IBOutlet weak var loose: UILabel!
    @IBOutlet weak var goals: UILabel!
    @IBOutlet weak var points: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupWith(item: RankViewModel, bgType: Background){
        place.text = formatPlace(rank: item.rank)
        team.text = item.clubName
        played.text = "\(item.played)"
        wid.text = "\(item.won)"
        draw.text = "\(item.draw)"
        loose.text = "\(item.lost)"
        goals.text = "\(item.goals)"
        points.text = "\(item.points)"
        
        switch bgType {
        case .even:
            self.contentView.backgroundColor = .white
        default:
            self.contentView.backgroundColor = .lightGray
        }
    }
    
    func formatPlace(rank:Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 2
//        formatter.maximumFractionDigits = fractionDigits
        return formatter.string(from: NSNumber(value: rank)) ?? ""
    }

}
