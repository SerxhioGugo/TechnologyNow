//
//  InfoViewController.swift
//  AllTech
//
//  Created by Serxhio Gugo on 9/16/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupNavController()
    }
    
    private func setupNavController() {
        view.backgroundColor = .white
        navigationItem.title = "About Us"
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = false
        let attributes = [NSAttributedString.Key.foregroundColor : UIColor(red: 0, green: 0.6471, blue: 0.3843, alpha: 1.0)]
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
  

}
