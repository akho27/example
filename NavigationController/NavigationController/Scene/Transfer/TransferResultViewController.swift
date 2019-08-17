//
//  TransferResultViewController.swift
//  NavigationController
//
//  Created by Akingson Chun on 11/07/2019.
//

import UIKit

class TransferResultViewController: UIViewControllerWithoutNavigationBar {
    
    let returnButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self,
                         action: #selector(handleButtonTap),
                         for: .touchUpInside)
        return button.asPrimaryButton(title: "Return to Root")
    }()
    
    let returnToDashboardButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self,
                         action: #selector(handleDashboardTap),
                         for: .touchUpInside)
        return button.asPrimaryButton(title: "Return to Dashboard")
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Result"
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .cyan
        view.addSubview(returnButton)
        view.addSubview(returnToDashboardButton)
    }
    
    private func setupConstraints() {
        returnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        returnButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        returnToDashboardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        returnToDashboardButton.topAnchor.constraint(equalTo: returnButton.bottomAnchor, constant: 24).isActive = true
    }
    
    @objc private func handleButtonTap() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func handleDashboardTap() {
        // Notes: Order matters
        tabBarController?.selectedIndex = 0
        navigationController?.popToRootViewController(animated: true)
    }
    
}
