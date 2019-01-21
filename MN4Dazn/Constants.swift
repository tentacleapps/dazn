//
//  Constants.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 19/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import Foundation

enum Background: Int {
    case odd
    case even
}

struct Settings {
    static let refreshTimerInterval: TimeInterval = 10
    struct Cells {
        static let news = "newsCell"
        static let scores = "scoresCell"
        static let standings = "standingsCell"
        static let standingsHeader = "standingsHeader"
    }
    struct ViewControllerIdentifiers {
        static let news = "news"
        static let standings = "standings"
        static let scores = "scores"
        static let newsDetails = "newsDetails"
    }
}
