//
//  MatchViewModel.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 20/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import UIKit

class MatchViewModel: NSObject {
    var teamA: String?
    var teamB: String?
    var teamAScore: String?
    var teamBScore: String?
    
    init(item: MatchXMLMappable) {
        self.teamA = item.teamA
        self.teamB = item.teamB
        self.teamAScore = item.fsA
        self.teamBScore = item.fsB
    }
}
