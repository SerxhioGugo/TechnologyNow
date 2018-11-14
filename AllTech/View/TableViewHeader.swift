//
//  File.swift
//  AllTech
//
//  Created by Serxhio Gugo on 10/10/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit

class TableViewHeader: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Daily Feed"
        label.textColor = UIColor(red: 0, green: 0.6471, blue: 0.3843, alpha: 1.0)
        label.font = UIFont(name: "AvenirNext-Bold", size: 25)
        label.textAlignment = .left
        return label
    }()
    
    private func setupUI(){
        backgroundColor = .white
        
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
