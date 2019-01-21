//
//  StandingsProvider.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 20/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import Foundation

protocol StandingsProviderProtocol {
    func loadStandings(completion: @escaping ([RankingItem]) -> ())
}

class StandingsProvider: StandingsProviderProtocol {
    private let sourcesURL = URL(string: "http://www.mobilefeeds.performgroup.com/utilities/interviews/techtest/standings.xml")!
    
    func loadStandings(completion: @escaping ([RankingItem]) -> ()) {
        URLSession.shared.dataTask(with: sourcesURL) { data, _, _ in
            if let data = data {
                guard let xmlString = String(data: data, encoding: String.Encoding.utf8) else {
                    return
                }
                let standing = StandingsGsmrsXMLMappable(XMLString: xmlString)
                guard let items = standing?.competition?.season?.round?.resultsTable.items else {
                    return
                }
                DispatchQueue.main.async {
                    completion(items)
                }
                
                
            }
        }.resume()
    }
}

class StandingsProviderMock: StandingsProviderProtocol {
    func loadStandings(completion: @escaping ([RankingItem]) -> ()) {
        let standing = getStandings()
        guard let items = standing?.competition?.season?.round?.resultsTable.items else {
            completion([])
            return
        }
        completion(items)
    }
    
    func getStandings() -> StandingsGsmrsXMLMappable?{
        let path = Bundle.main.path(forResource: "standings", ofType: "xml") // file path for file "data.txt"
        do {
            let xmlString = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            print( xmlString)
            
            let stangings = StandingsGsmrsXMLMappable(XMLString: xmlString)
            return(stangings)
        } catch {
            return nil
        }
    }
}
