//
//  NewsListViewModel.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 19/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import UIKit

class NewsListViewModel: NSObject {
    
    @objc dynamic private(set) var newsViewModels: [NewsViewModel] = [NewsViewModel]()
    private var dataProvider: NewsProviderProtocol
    private var token :NSKeyValueObservation?
    var bindToSourceViewModels :(() -> ()) = {  }
    
    init(provider: NewsProviderProtocol) {
        self.dataProvider = provider
        super.init()
        token = self.observe(\.newsViewModels) { _,_ in
            self.bindToSourceViewModels()
        }
        getNews()
    }
    
    func invalidateObservers() {
        self.token?.invalidate()
    }
    
    private func getNews(){
        self.dataProvider.loadNews { [unowned self] news in
            self.newsViewModels = news.compactMap(NewsViewModel.init)
            print(self.newsViewModels)
        }
    }
}
