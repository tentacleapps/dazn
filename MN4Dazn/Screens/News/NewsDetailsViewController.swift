//
//  NewsDetailsViewController.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 20/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import UIKit
import WebKit

protocol WebViewProtocol {
    func getUrl() -> URL?
}

class NewsDetailsViewController: UIViewController {

    @IBOutlet weak var webVIew: WKWebView!
    private var viewModel: WebViewProtocol?
    
    func setup(viewModel: WebViewProtocol){
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = viewModel?.getUrl() else {
            return
        }
        webVIew.load(URLRequest(url: url))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
