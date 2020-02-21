//
//  ViewController.swift
//  keyboardHandlingLab
//
//  Created by Ahad Islam on 2/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.usernameTextField.delegate = self
        loginView.passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerKeyboardNotifications()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterKeyboardNotifications()
        
    }
    
    private func registerKeyboardNotifications() {
        print("Registered")
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func unregisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func willShowKeyboard(_ notification: Notification) {
        guard let info = notification.userInfo, let keyboardFrame = info["UIKeyboardFrameBeginUserInfoKey"] as? CGRect else {
            print("Userinfo is nil.")
            return
        }
        
        loginView.moveViewUp(keyboardFrame.height)
        
        view.setNeedsLayout()
    }
    
    @objc private func willHideKeyboard(_ notification: Notification) {
        guard let info = notification.userInfo, let keyboardFrame = info["UIKeyboardFrameEndUserInfoKey"] as? CGRect else {
            print("Userinfo is nil.")
            return
        }
        
        loginView.moveViewUp(0)
    }


}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

