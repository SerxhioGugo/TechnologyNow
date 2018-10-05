//
//  DropShadow.swift
//  AllTech
//
//  Created by Serxhio Gugo on 9/20/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit

extension UIView {
     func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
