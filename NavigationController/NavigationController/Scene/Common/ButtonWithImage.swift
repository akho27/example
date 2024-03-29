//
//  ButtonWithImage.swift
//  NavigationController
//
//  Created by Akingson Chun on 11/07/2019.
//

import UIKit

class UIButtonWithImage: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let imageView = imageView {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: bounds.width - 35, bottom: 5, right: 5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: imageView.frame.width)
        }
    }
    
}
