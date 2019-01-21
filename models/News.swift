//
//  NewsItem.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 17/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import Foundation
import XMLMapper

class NewsXMLMappable: XMLMappable {
    var nodeName: String!
    
    var channel: NewsChannel!
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        channel <- map["channel"]
    }
}

class NewsChannel: XMLMappable {
    var nodeName: String!
    
    var items: [NewsItem]?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        items <- map["item"]
    }
}

class NewsItem: XMLMappable {
    var nodeName: String!
    
    var title: String?
    var pubDate: String?
    var imageUrl: String?
    var link: String?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        title <- map["title"]
        pubDate <- map["pubDate"]
        imageUrl <- map.attributes["enclosure.url"]
        link <- map["link"]
    }
}
