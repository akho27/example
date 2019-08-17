//
//  TransferInputViewController.swift
//  NavigationController
//
//  Created by Akingson Chun on 11/07/2019.
//

import UIKit

class TransferInputViewController: UIViewController {
    
    let topBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    let bottomBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self,
                         action: #selector(handleButtonTap),
                         for: .touchUpInside)
        return button.asPrimaryButton(title: "Confirm")
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Transfer"
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .yellow
        view.addSubview(confirmButton)
        view.addSubview(topBarView)
        view.addSubview(bottomBarView)
    }
    
    private func setupConstraints() {
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        topBarView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topBarView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topBarView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topBarView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        bottomBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomBarView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomBarView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomBarView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc private func handleButtonTap() {
        let controller = TransferResultViewController()
        navigationController?.pushViewController(controller, animated: true)
    }

}
