//
//  RankViewModel.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 20/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import Foundation

class RankViewModel: NSObject {
    var clubName: String
    var rank: Int
    var played: Int
    var won: Int
    var draw: Int
    var lost: Int
    var goals: Int
    var points: Int
    
    init(item: RankingItem) {
        self.clubName = item.clubName ?? ""
        self.rank = item.rank ?? 0
        self.played = item.matchesTotal ?? 0
        self.won = item.matchesWon ?? 0
        self.draw = item.matchesDraw ?? 0
        self.lost = item.matchesLost  ?? 0
        self.goals = (item.goalsPro ?? 0) - (item.goalsAgainst ?? 0)
        self.points = item.points ?? 0
    }
}
