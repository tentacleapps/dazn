//
//  ViewController.swift
//  MN4Dazn
//
//  Created by Marcin Nowak on 17/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var menu: UIView!
    @IBOutlet weak var menuHeightConstraint: NSLayoutConstraint!
    weak var current: UIViewController?
    var newsVC: NewsViewController!
    var scoresVC: ScoresViewController!
    var standingsVC: StandingsViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setuSubviews()
    }
    
    func initialize() {
        
        self.newsVC = self.storyboard?.instantiateViewController(withIdentifier: Settings.ViewControllerIdentifiers.news) as? NewsViewController
        self.scoresVC = self.storyboard?.instantiateViewController(withIdentifier: Settings.ViewControllerIdentifiers.scores) as? ScoresViewController
        self.standingsVC = self.storyboard?.instantiateViewController(withIdentifier: Settings.ViewControllerIdentifiers.standings) as? StandingsViewController
        
        addChild(newsVC!)
        addChild(scoresVC!)
        addChild(standingsVC!)
    }
    
    func setuSubviews() {
        let subview = newsVC.view!
        container.addSubview(subview)
        self.addConstrains(subview: subview)
        
        current = newsVC
        self.menuHeightConstraint.constant = 0
        self.menu.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func toogleMenu(_ sender: Any) {
        if self.menu.isHidden {
            self.showMenu()
        } else {
            self.hideMenu()
        }
    }
    
    func hideMenu(){
        self.menuHeightConstraint.constant = 0
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        }) { (finished) in
            self.menu.isHidden = true
        }
    }
    
    func showMenu(){
        self.menuHeightConstraint.constant = 130
        self.menu.isHidden = false
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        }) { (finished) in
            
        }
    }

    @IBAction func showNews(_ sender: Any) {
        show(newsVC!)
    }
    
    @IBAction func showScores(_ sender: Any) {
        show(scoresVC!)
    }
    
    @IBAction func showStandings(_ sender: Any) {
        show(standingsVC!)
    }
    
    func show(_ child: UIViewController) {
        hideMenu()
        
        if child == current {
            return
        }
        
        transition(from: current!, to: child, duration: 0.5, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
            self.addConstrains(subview: child.view)
        }) { (finished) in
            self.current = child
        }
    }
    
    func addConstrains(subview: UIView){
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subview.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            subview.topAnchor.constraint(equalTo: self.container.topAnchor),
            subview.bottomAnchor.constraint(equalTo: self.container.bottomAnchor),
            ])
    }
}
