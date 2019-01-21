//
//  StandingsListViewModel.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 20/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import Foundation

class StandingsListViewModel: NSObject {
    @objc dynamic private(set) var standingsViewModel: [RankViewModel] = [RankViewModel]()
    private var token :NSKeyValueObservation?
    var bindToSourceViewModels :(() -> ()) = {  }
    private var dataProvider: StandingsProviderProtocol
    
    init(provider: StandingsProviderProtocol) {
        self.dataProvider = provider
        super.init()
        token = self.observe(\.standingsViewModel) { _,_ in
            self.bindToSourceViewModels()
        }
        getStandings()
    }
    
    private func getStandings(){
        self.dataProvider.loadStandings { [unowned self] standing in
            self.standingsViewModel = standing.compactMap(RankViewModel.init).sorted {
                $0.rank < $1.rank
            }
        }
    }
}
