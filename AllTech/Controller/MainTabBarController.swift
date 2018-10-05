//
//  MainTabBarController.swift
//  AllTech
//
//  Created by Serxhio Gugo on 9/16/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = .white
        setupTabBar()
        
    }

    func setupTabBar() {
        
        let feedController = createNavController(vc: FeedViewController(), selected: UIImage(named: "home-selected")!, unselected: UIImage(named: "home-nonselected")!)
        let favoriteController = createNavController(vc: FavoriteViewController(), selected: UIImage(named: "star-selected")!, unselected: UIImage(named: "star-nonselected")!)
        let infoController = createNavController(vc: InfoViewController(), selected: UIImage(named: "info-selected")!, unselected: UIImage(named: "info-nonselected")!)
        
        viewControllers = [feedController, favoriteController, infoController]
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            
        }
    }
}
