//
//  Standings.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 19/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import Foundation
import XMLMapper

class StandingsGsmrsXMLMappable: XMLMappable {
    var nodeName: String!

    var competition: CompetitionXMLMappable?

    required init?(map: XMLMap) {}

    func mapping(map: XMLMap) {
        competition <- map["competition"]
    }
}

class CompetitionXMLMappable: XMLMappable {
    var nodeName: String!
    
    var season: SeasonXMLMappable?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        season <- map["season"]
    }
}

class SeasonXMLMappable: XMLMappable {
    var nodeName: String!
    
    var round: RoundXMLMappable?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        round <- map["round"]
    }
}

class RoundXMLMappable: XMLMappable {
    var nodeName: String!
    
    var resultsTable: ResultsTable!
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        resultsTable <- map["resultstable"]
    }
}

class ResultsTable: XMLMappable {
    var nodeName: String!
    
    var items: [RankingItem]?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        items <- map["ranking"]
    }
}

class RankingItem: XMLMappable {
    var nodeName: String!
    
    var clubName: String?
    var rank: Int?
    var matchesTotal: Int?
    var matchesWon: Int?
    var matchesDraw: Int?
    var matchesLost: Int?
    var goalsPro: Int?
    var goalsAgainst: Int?
    var points: Int?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        clubName <- map.attributes["club_name"]
        rank <- map.attributes["rank"]
        matchesTotal <- map.attributes["matches_total"]
        matchesWon <- map.attributes["matches_won"]
        matchesDraw <- map.attributes["matches_draw"]
        matchesLost <- map.attributes["matches_lost"]
        goalsPro <- map.attributes["goals_pro"]
        goalsAgainst <- map.attributes["goals_against"]
        points <- map.attributes["points"]   
    }
}
