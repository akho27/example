//
//  UIViewController+Ext.swift
//  NavigationController
//
//  Created by Akingson Chun on 11/07/2019.
//

import UIKit

extension UIViewController {
    
    func getControllers() {
        if let topController = UIApplication.topViewController() {
            if let viewControllers = navigationController?.viewControllers {
                    print("Top: \(topController) \nwith: \(viewControllers)")
            }
        }
    }
    
    func checkTabBarController() {
        if tabBarController != nil {
            print("TABBAR exist")
        } else {
            print("TABBAR does not exist")
        }
    }
    
    func addCustomBackButton() {
        let backButton = UIButton(type: .system)
        backButton.setImage(#imageLiteral(resourceName: "logo_face_id"), for: .normal)
        backButton.setTitle("Back", for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        backButton.addTarget(self, action: #selector(handleBackButton(sender:)), for: .touchUpInside)
        
        let barButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = barButton
    }
    
    @objc func handleBackButton(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
