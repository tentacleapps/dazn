//
//  NewsProviderProtocol.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 19/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import Foundation

protocol NewsProviderProtocol {
    func loadNews(completion: @escaping ([NewsItem]) -> ())
}

class NewsProvider: NewsProviderProtocol {
    private let sourcesURL = URL(string: "http://www.mobilefeeds.performgroup.com/utilities/interviews/techtest/latestnews.xml")!
    
    func loadNews(completion: @escaping ([NewsItem]) -> ()) {
        URLSession.shared.dataTask(with: sourcesURL) { data, _, _ in
            
            if let data = data {
                guard let xmlString = String(data: data, encoding: String.Encoding.utf8) else {
                    return
                }
                let news = NewsXMLMappable(XMLString: xmlString)
                guard let items = news?.channel.items else {
                    return
                }
                DispatchQueue.main.async {
                    completion(items)
                }
            }
        }.resume()
    }
}

class NewsProviderMock: NewsProviderProtocol {
    func loadNews(completion: @escaping ([NewsItem]) -> ()) {
        let news = getNews()
        guard let items = news?.channel.items else {
            completion([])
            return
        }
        completion(items)
    }
    
    func getNews() -> NewsXMLMappable? {
        let path = Bundle.main.path(forResource: "latestnews", ofType: "xml") // file path for file "data.txt"
        do {
            let xmlString = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            print( xmlString)
            
            let news = NewsXMLMappable(XMLString: xmlString)
            return(news)
        } catch {
            return nil
        }
    }
}
