//
//  ScoresViewController.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 19/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import UIKit

class ScoresViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var dataProvider: ScoresProviderProtocol!
    private var viewModel: ScoresListViewModel!
    private var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        #if MOCK
        self.dataProvider = ScoresProviderMock()
        #else
        self.dataProvider = ScoresProvider()
        #endif
        self.viewModel = ScoresListViewModel(provider: self.dataProvider)
        
        self.viewModel.bindToSourceViewModels = {
            self.updateDataSource()
        }
        updateDataSource()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupTimer()
        self.viewModel.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    deinit {
        self.viewModel.invalidateObservers()
        timer.invalidate()
    }
    
    func setupTimer(){
        self.timer = Timer.scheduledTimer(withTimeInterval: Settings.refreshTimerInterval, repeats: true, block: { [weak self] _ in
            self?.viewModel.reloadData()
        })
    }
    
    
    private func updateDataSource() {
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    
    
}

extension ScoresViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.scoresViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Settings.Cells.scores, for: indexPath) as! ScoresTableViewCell
        let item = self.viewModel.scoresViewModel[indexPath.row]
        cell.setupWith(item: item, bgType: Background(rawValue: indexPath.row % 2)!)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.viewModel.date
    }
}
