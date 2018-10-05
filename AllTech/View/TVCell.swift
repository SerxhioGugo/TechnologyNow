//
//  TVCell.swift
//  AllTech
//
//  Created by Serxhio Gugo on 9/27/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit

class TVCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
//        label.insetsLayoutMarginsFromSafeArea = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"AvenirNext-Bold", size: 13)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
//        label.insetsLayoutMarginsFromSafeArea = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"AvenirNext-Bold", size: 10)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    let shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dropShadow()
        
        return view
    }()
    
    let mainImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 6
        img.backgroundColor = .clear
        
        return img
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        //        label.insetsLayoutMarginsFromSafeArea = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"AvenirNext-MediumItalic", size: 9)
        label.textColor = .lightGray
        label.textAlignment = .right
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(shadowView)
        addSubview(mainImageView)
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            
            shadowView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            shadowView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            shadowView.widthAnchor.constraint(equalToConstant: 150),
            shadowView.heightAnchor.constraint(equalToConstant: 80),
            
            mainImageView.topAnchor.constraint(equalTo: shadowView.topAnchor),
            mainImageView.leftAnchor.constraint(equalTo: shadowView.leftAnchor),
            mainImageView.rightAnchor.constraint(equalTo: shadowView.rightAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: mainImageView.leftAnchor, constant: -10),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 45),
            
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descLabel.rightAnchor.constraint(equalTo: mainImageView.leftAnchor, constant: -10),
            descLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            descLabel.heightAnchor.constraint(equalToConstant: 60),
            
            dateLabel.topAnchor.constraint(equalTo: shadowView.bottomAnchor),
            dateLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            dateLabel.widthAnchor.constraint(equalToConstant: 65),
            
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


















