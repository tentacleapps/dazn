//
//  StandingsViewController.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 19/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import UIKit

class StandingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var dataProvider: StandingsProviderProtocol!
    private var viewModel: StandingsListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        #if MOCK
        self.dataProvider = StandingsProviderMock()
        #else
        self.dataProvider = StandingsProvider()
        #endif
        self.viewModel = StandingsListViewModel(provider: self.dataProvider)
        self.viewModel.bindToSourceViewModels = {
            self.updateDataSource()
        }
    }
    
    private func updateDataSource() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
    }
}

extension StandingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.standingsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Settings.Cells.standings, for: indexPath) as! StandingsTableViewCell
        let item = self.viewModel.standingsViewModel[indexPath.row]
        cell.setupWith(item: item, bgType: Background(rawValue: indexPath.row % 2)!)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension StandingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: Settings.Cells.standingsHeader)
        return cell
    }
}
