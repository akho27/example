//
//  LoginViewController.swift
//  NavigationController
//
//  Created by Akingson Chun on 10/07/2019.
//

import UIKit

class LoginViewController: UIViewControllerWithoutNavigationBar {
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self,
                         action: #selector(handleLoginTap),
                         for: .touchUpInside)
        return button.asPrimaryButton(title: "Login")
    }()
    
    let transferButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self,
                         action: #selector(handleTransferTap),
                         for: .touchUpInside)
        return button.asPrimaryButton(title: "Quick Transfer")
    }()
    
    let favouritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self,
                         action: #selector(handleFavouritesTap),
                         for: .touchUpInside)
        return button.asPrimaryButton(title: "Favourites")
    }()
    
    let buttonWithImage: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Quick Transaction", for: .normal)
        button.setImage(#imageLiteral(resourceName: "transfer").withRenderingMode(.alwaysOriginal), for: .normal)
//        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 36, bottom: 0, right: 0)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
        setupView()
        setupConstraints()
        getControllers()
    }
    
    private func setupView() {
        view.backgroundColor = .red
        view.addSubview(loginButton)
        view.addSubview(transferButton)
        view.addSubview(favouritesButton)
        view.addSubview(buttonWithImage)
    }
    
    private func setupConstraints() {
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        transferButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        transferButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 24).isActive = true
        
        favouritesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        favouritesButton.topAnchor.constraint(equalTo: transferButton.bottomAnchor, constant: 24).isActive = true
        
        buttonWithImage.topAnchor.constraint(equalTo: favouritesButton.bottomAnchor, constant: 24).isActive = true
        buttonWithImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonWithImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        buttonWithImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        buttonWithImage.heightAnchor.constraint(equalToConstant: 58).isActive = true
    }
    
    @objc private func handleLoginTap() {
        let controller = TabBarController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func handleTransferTap() {
        let controller = TransferInputViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func handleFavouritesTap() {
        let controller = FavouritesListViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
