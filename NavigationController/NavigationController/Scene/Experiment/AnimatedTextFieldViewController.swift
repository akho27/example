//
//  AnimatedTextFieldViewController.swift
//  NavigationController
//
//  Created by Akingson Chun on 12/07/2019.
//

import UIKit
import SkyFloatingLabelTextField
import RxSwift

class AnimatedTextFieldViewController: UIViewController {
    
    let usernameTextField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = "Username"
        textField.titleFormatter = { return $0 }
        textField.selectedTitleColor = .red
        textField.textColor = .red
        textField.selectedLineColor = .red
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        configureBinding()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(usernameTextField)
    }
    
    private func setupConstraints() {
        usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        usernameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 36).isActive = true
        usernameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -36).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func configureBinding() {

    }

}
