//
//  Scores.swift
//  MN4DaznTests
//
//  Created by Marcin Nowak on 19/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import Foundation
import XMLMapper

class ScoresXMLMappable: XMLMappable {
    var nodeName: String!
    
    var competition: Competition?
    var method: MethodXMLMappable?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        competition <- map["competition"]
        method <- map["method"]
    }
}

class Competition: XMLMappable {
    var nodeName: String!
    
    var season: Season?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        season <- map["season"]
    }
}

class Season: XMLMappable {
    var nodeName: String!
    
    var round: Round?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        round <- map["round"]
    }
}

class Round: XMLMappable {
    var nodeName: String!
    
    var groups: [GroupXMLMappable]?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        groups <- map["group"]
    }
}

class GroupXMLMappable: XMLMappable {
    var nodeName: String!
    
    var matches: [MatchXMLMappable]?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        matches <- map["match"]
    }
}

class MatchXMLMappable: XMLMappable {
    var nodeName: String!
    
    var teamA: String?
    var teamB: String?
    var fsA: String?
    var fsB: String?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        teamA <- map.attributes["team_A_name"]
        teamB <- map.attributes["team_B_name"]
        fsA <- map.attributes["fs_A"]
        fsB <- map.attributes["fs_B"]
    }
}
