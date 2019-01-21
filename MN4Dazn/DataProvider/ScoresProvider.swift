//
//  ScoresProvider.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 20/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import Foundation

protocol ScoresProviderProtocol {
    func loadScores(completion: @escaping ([MatchXMLMappable], String?) -> ())
}

class ScoresProvider: ScoresProviderProtocol {
    private let sourcesURL = URL(string: "http://www.mobilefeeds.performgroup.com/utilities/interviews/techtest/scores.xml")!
    
    func loadScores(completion: @escaping ([MatchXMLMappable], String?) -> ()) {
        URLSession.shared.dataTask(with: sourcesURL) { data, _, _ in
            
            if let data = data {
                guard let xmlString = String(data: data, encoding: String.Encoding.utf8) else {
                    return
                }
                let scores = ScoresXMLMappable(XMLString: xmlString)
                
                guard let date = scores?.method?.parameters?.first(where: {$0.name == "date"}) else {
                    return
                }
                
                guard let seasonRound = scores?.competition?.season?.round else {
                    return
                }
                
                guard let matches = seasonRound.groups?.compactMap ({
                    $0.matches
                }).flatMap({$0}) else {
                    return
                }
                
                DispatchQueue.main.async {
                    completion(matches, date.value)
                }
            }
            
            }.resume()
    }
}

class ScoresProviderMock: ScoresProviderProtocol {
    func loadScores(completion: @escaping ([MatchXMLMappable], String?) -> ()) {
        let scores = getScores()
        guard let date = scores?.method?.parameters?.first(where: {$0.name == "date"}) else {
            completion([], nil)
            return
        }
        
        guard let seasonRound = scores?.competition?.season?.round else {
            completion([], date.value)
            return
        }
        
        guard let matches = seasonRound.groups?.compactMap ({
            $0.matches
        }).flatMap({$0}) else {
            completion([], date.value)
            return
        }
        
        completion(matches, date.value)
    }
    
    func getScores() -> ScoresXMLMappable?{
        let path = Bundle.main.path(forResource: "scores", ofType: "xml")
        do {
            let xmlString = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            print( xmlString)
            
            let scores = ScoresXMLMappable(XMLString: xmlString)
            return(scores)
        } catch {
            return nil
        }
    }
}
