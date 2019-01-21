//
//  NewsViewController.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 19/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataProvider: NewsProviderProtocol!
    private var viewModel: NewsListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        #if MOCK
        self.dataProvider = NewsProviderMock()
        #else
        self.dataProvider = NewsProvider()
        #endif
        self.viewModel = NewsListViewModel(provider: self.dataProvider)
        self.viewModel.bindToSourceViewModels = {
            self.updateDataSource()
        }
        updateDataSource()
    }
    
    private func updateDataSource() {

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
    }
    
    deinit {
        self.viewModel.invalidateObservers()
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.newsViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Settings.Cells.news, for: indexPath) as! NewsTableViewCell
        let item = self.viewModel.newsViewModels[indexPath.row]
        cell.setupWith(item: item)
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.viewModel.newsViewModels[indexPath.row]
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: Settings.ViewControllerIdentifiers.newsDetails) as? NewsDetailsViewController else {
            return
        }
        vc.setup(viewModel: item)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
