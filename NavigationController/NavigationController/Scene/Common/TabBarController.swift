//
//  TabBarController.swift
//  NavigationController
//
//  Created by Akingson Chun on 11/07/2019.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        
        let dashboardVC = DashboardViewController()
        dashboardVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        let dashboardNavVC = UINavigationController(rootViewController: dashboardVC)
        
        let transferVC = TransferLandingViewController()
        transferVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let transferNavVC = UINavigationController(rootViewController: transferVC)
        
        
        viewControllers = [dashboardNavVC, transferNavVC]
        
    }
    
}
