//
//  NewsViewModel.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 19/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import UIKit

class NewsViewModel: NSObject, WebViewProtocol {
    var image: String?
    var title: String?
    var date: String?
    var link: URL?
    
    init(item: NewsItem) {
        self.image = item.imageUrl
        self.title = item.title
        self.date = item.pubDate
        guard let link = item.link else {
            return
        }
        self.link = URL(string: link)
    }
    
    func getUrl() -> URL? {
        return link
    }
}
