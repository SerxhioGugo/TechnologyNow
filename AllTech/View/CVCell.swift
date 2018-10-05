//
//  CVCell.swift
//  AllTech
//
//  Created by Serxhio Gugo on 9/18/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit

class CVCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
    let topView: UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.dropShadow()
        
        return topView
    }()
    
    let imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 6
        img.backgroundColor = .clear
        
        return img
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.insetsLayoutMarginsFromSafeArea = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"AvenirNext-Bold", size: 16)
        label.textColor = .white
//        label.backgroundColor = .clear
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 1.0, height: 1.0)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    func setupUI(){
        addSubview(topView)
        topView.addSubview(imageView)
        imageView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
        
        topView.topAnchor.constraint(equalTo: self.topAnchor),
        topView.leftAnchor.constraint(equalTo: self.leftAnchor),
        topView.rightAnchor.constraint(equalTo: self.rightAnchor),
        topView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant : -25),
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25),
        titleLabel.widthAnchor.constraint(equalTo: self.imageView.widthAnchor, multiplier: 0.9),
        titleLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
