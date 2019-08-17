//
//  FavouritesListViewController.swift
//  NavigationController
//
//  Created by Akingson Chun on 11/07/2019.
//

import UIKit

class FavouritesListViewController: UIViewController {
    
    let topBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    let quickTransferButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self,
                         action: #selector(handleQuickTransferTap),
                         for: .touchUpInside)
        return button.asPrimaryButton(title: "Quick Transfer")
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Favourites"
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .magenta
        view.addSubview(quickTransferButton)
        view.addSubview(topBarView)
    }
    
    private func setupConstraints() {
        quickTransferButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        quickTransferButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        topBarView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topBarView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topBarView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topBarView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc private func handleQuickTransferTap() {
        let controller = TransferInputViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
