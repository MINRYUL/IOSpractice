//
//  TabBarController.swift
//  DiffableExample
//
//  Created by 김민창 on 2022/01/06.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureTabBar()
    }
    
    private func configureTabBar() {
        let diffableViewController = UINavigationController(rootViewController: ViewController())
        diffableViewController.title = "Diffable"
        
        let collectionViewController = UINavigationController(rootViewController: CollectionViewController())
        collectionViewController.title = "Collection"
        
        self.viewControllers = [diffableViewController, collectionViewController]
    }
}
