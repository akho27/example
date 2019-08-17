//
//  DashboardViewController.swift
//  NavigationController
//
//  Created by Akingson Chun on 11/07/2019.
//

import UIKit

class DashboardViewController: UIViewControllerWithoutNavigationBar {
    
    let transferButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self,
                         action: #selector(handleButtonTap),
                         for: .touchUpInside)
        return button.asPrimaryButton(title: "Transfer")
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self,
                         action: #selector(handleLogoutTap),
                         for: .touchUpInside)
        return button.asPrimaryButton(title: "Logout")
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Dashboard"
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .blue
        view.addSubview(transferButton)
        view.addSubview(logoutButton)
    }
    
    private func setupConstraints() {
        transferButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        transferButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.topAnchor.constraint(equalTo: transferButton.bottomAnchor, constant: 24).isActive = true
    }
    
    @objc private func handleButtonTap() {
        let controller = TransferInputViewController()
        controller.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func handleLogoutTap() {
        tabBarController?.navigationController?.popToRootViewController(animated: true)
    }

}
