//
//  ScoresTableViewCell.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 20/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import UIKit


class ScoresTableViewCell: UITableViewCell {
    @IBOutlet weak var teamA: UILabel!
    @IBOutlet weak var teamB: UILabel!
    @IBOutlet weak var scoreA: UILabel!
    @IBOutlet weak var scoreB: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupWith(item: MatchViewModel, bgType: Background){
        teamA.text = item.teamA
        teamB.text = item.teamB
        scoreA.text = item.teamAScore
        scoreB.text = item.teamBScore
        
        switch bgType {
        case .even:
            self.contentView.backgroundColor = .white
        default:
            self.contentView.backgroundColor = .lightGray
        }
    }

}
