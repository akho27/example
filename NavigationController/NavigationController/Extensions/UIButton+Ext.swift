//
//  UIButton+Ext.swift
//  NavigationController
//
//  Created by Akingson Chun on 11/07/2019.
//

import UIKit

extension UIButton {
    
    func asPrimaryButton(title: String) -> UIButton {
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 16)
        backgroundColor = .white
        return self
    }
    
    func selectedButton(title:String, icon: UIImage, widthConstraints: NSLayoutConstraint){
        self.backgroundColor = UIColor(red: 0, green: 118/255, blue: 254/255, alpha: 1)
        self.setTitle(title, for: .normal)
        self.setTitle(title, for: .highlighted)
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitleColor(UIColor.white, for: .highlighted)
        self.setImage(icon, for: .normal)
        self.setImage(icon, for: .highlighted)
        let imageWidth = self.imageView!.frame.width
        let textWidth = (title as NSString).size(withAttributes: [NSAttributedString.Key.font: self.titleLabel!.font!]).width
        let width = textWidth + imageWidth + 24
        //24 - the sum of your insets from left and right
        widthConstraints.constant = width
        self.layoutIfNeeded()
    }
    
}
