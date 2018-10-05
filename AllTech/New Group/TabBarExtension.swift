//
//  TabBarExtension.swift
//  AllTech
//
//  Created by Serxhio Gugo on 9/17/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit

extension UITabBarController {
     func createNavController(vc: UIViewController, selected: UIImage, unselected: UIImage) -> UINavigationController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselected
        navController.tabBarItem.selectedImage = selected
        return navController
    }
}
