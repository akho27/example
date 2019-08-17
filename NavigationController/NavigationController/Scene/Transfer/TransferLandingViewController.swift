//
//  TransferLandingViewController.swift
//  NavigationController
//
//  Created by Akingson Chun on 11/07/2019.
//

import UIKit

class TransferLandingViewController: UIViewController {
    
    let transferButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self,
                         action: #selector(handleButtonTap),
                         for: .touchUpInside)
        return button.asPrimaryButton(title: "Transfer")
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Transfer"
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .green
        view.addSubview(transferButton)
    }
    
    private func setupConstraints() {
        transferButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        transferButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc private func handleButtonTap() {
        let controller = TransferInputViewController()
        controller.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
