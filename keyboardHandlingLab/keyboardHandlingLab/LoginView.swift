//
//  loginView.swift
//  keyboardHandlingLab
//
//  Created by Ahad Islam on 2/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class LoginView: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title label"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        return label
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .bezel
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var usernameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .bezel
        return tf
    }()
    
    var bottomButtonConstraint = NSLayoutConstraint()
    var bottomPasswordConstraint = NSLayoutConstraint()
    
    
    var originalBottomButtonConstraint = NSLayoutConstraint()
    var originalPasswordConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveViewUp(_ num: CGFloat) {
        print(bottomButtonConstraint.constant)
        if num != 0 {
            bottomButtonConstraint.constant -= num + 40
            
            bottomPasswordConstraint.constant -= num
            
            UIView.animate(withDuration: 2) {
                self.layoutIfNeeded()
            }
        } else {
            bottomButtonConstraint.constant -= originalBottomButtonConstraint.constant
            bottomPasswordConstraint.constant -= originalPasswordConstraint.constant
        }
    }
    
    
    private func setupView() {
        backgroundColor = .systemGroupedBackground
        setupTitleLabel()
        setupLoginButton()
        setupPasswordLabel()
        setupPasswordTextfield()
        setupUsernameLabel()
        setupUsernameTextField()
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20)])
    }
    
    private func setupLoginButton() {
        addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButtonConstraint = loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12)
        originalBottomButtonConstraint = bottomButtonConstraint
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomButtonConstraint,
            loginButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)])
    }
    
    private func setupPasswordLabel() {
        addSubview(passwordLabel)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomPasswordConstraint = passwordLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 200)
        originalPasswordConstraint = bottomPasswordConstraint
        NSLayoutConstraint.activate([
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            passwordLabel.trailingAnchor.constraint(equalTo: centerXAnchor),
            bottomPasswordConstraint])
    }
    
    private func setupPasswordTextfield() {
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            passwordTextField.centerYAnchor.constraint(equalTo: passwordLabel.centerYAnchor, constant: 0)])
    }
    
    private func setupUsernameLabel() {
        addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            usernameLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -20)])
    }
    
    private func setupUsernameTextField() {
        addSubview(usernameTextField)
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameTextField.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            usernameTextField.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor, constant: 0)])
    }
}
