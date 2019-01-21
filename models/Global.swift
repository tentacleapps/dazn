//
//  Global.swift
//  MN4DaznTests
//
//  Created by Marcin Nowak on 19/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import Foundation
import XMLMapper

class MethodXMLMappable: XMLMappable {
    var nodeName: String!
    
    var parameters: [ParameterXMLMappable]?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        parameters <- map["parameter"]
    }
}

class ParameterXMLMappable: XMLMappable {
    var nodeName: String!
    
    var name: String?
    var value: String?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        name <- map.attributes["name"]
        value <- map.attributes["value"]
    }
}
