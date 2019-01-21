//
//  ScoresListViewModel.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 20/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import UIKit

class ScoresListViewModel: NSObject {
    
    @objc dynamic private(set) var scoresViewModel: [MatchViewModel] = [MatchViewModel]()
    private(set) var date: String = ""
    private var token :NSKeyValueObservation?
    var bindToSourceViewModels :(() -> ()) = {  }
    private var dataProvider: ScoresProviderProtocol
    
    init(provider: ScoresProviderProtocol) {
        self.dataProvider = provider
        super.init()
        token = self.observe(\.scoresViewModel) { _,_ in
            self.bindToSourceViewModels()
        }
        getScores()
    }
    
    func invalidateObservers() {
        self.token?.invalidate()
    }
    
    private func getScores(){
        self.dataProvider.loadScores { [unowned self] matches, date in
            self.scoresViewModel = matches.compactMap(MatchViewModel.init)
            self.date = date ?? ""
            
            print(self.scoresViewModel)
        }
    }
    
    func reloadData(){
        getScores()
    }
}
