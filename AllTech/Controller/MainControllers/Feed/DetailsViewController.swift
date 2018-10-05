//
//  DetailsViewController.swift
//  AllTech
//
//  Created by Serxhio Gugo on 10/3/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var authorLabel: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupUI()
        updateUI()
    }
    
    let authorName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        
        return label
    }()
    
    
    private func setupUI() {
        
        view.addSubview(authorName)
        
        NSLayoutConstraint.activate([
            authorName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authorName.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            authorName.heightAnchor.constraint(equalToConstant: 130),
            authorName.widthAnchor.constraint(equalToConstant: 200),
            ])
        
    }
    
    func updateUI() {
        authorName.text = authorLabel
    }
}
