//
//  ExpTextFieldViewController.swift
//  NavigationController
//
//  Created by Akingson Chun on 16/07/2019.
//

import UIKit
import RxSwift
import RxCocoa

class ExpTextFieldViewController: UIViewController {
    
    let viewModel = ExpTextFieldViewModel()
    
    private let disposeBag = DisposeBag()
    
    // MARK: UI Properties
    
    let expTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter here..."
        textField.backgroundColor = .lightGray
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let expButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    }()
    
    // MARK: Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        configureBinding()
    }
    
    // MARK: Methods
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(expTextField)
        view.addSubview(expButton)
    }
    
    private func setupConstraints() {
        expTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        expTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 36).isActive = true
        expTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -36).isActive = true
        expTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        expButton.topAnchor.constraint(equalTo: expTextField.bottomAnchor, constant: 24).isActive = true
        expButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 36).isActive = true
        expButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -36).isActive = true
        expButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
    
    private func configureBinding() {
        
        expTextField.rx.text
            .orEmpty
            .bind(to: viewModel.input.username)
            .disposed(by: disposeBag)
        
        expButton.rx.tap
            .bind(to: viewModel.input.buttonDidTap)
            .disposed(by: disposeBag)
        
        viewModel.output.prepopulatedText
            .subscribe(onNext: { [weak self] text in
                self?.expTextField.text = text
                self?.viewModel.input.username.onNext(text)
            })
            .disposed(by: disposeBag)
        
        viewModel.output.text
            .subscribe(onNext: { message in
                print("AHHA: \(message)")
            })
            .disposed(by: disposeBag)
        
    }
    
}
