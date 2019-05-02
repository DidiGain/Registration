//
//  ViewController.swift
//  LogIn
//
//  Created by Di Gain on 23/04/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit

let user = User()

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        registerForKeyboardNotifications()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func stopEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func tapRecognized(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        guard  loginTextField.text?.isEmpty == false,
               loginTextField.text == user.login
        else {
            alertMessage(message: "Invalid login!")
            return
        }
        
        guard  passwordTextField.text?.isEmpty == false,
               passwordTextField.text == user.password
        else {
            alertMessage(message: "Invalid password!")
                return
        }
    }
    
    func alertMessage(message: String) {
        let ac = UIAlertController(title: "Try again", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        ac.addAction(ok)
        present(ac, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
        if segue.identifier == "WelcomeBoard" {
            let vc = segue.destination as! WelcomeViewController
            vc.login = loginTextField.text
        } else if segue.identifier == "Login" {
            let vc = segue.destination as! InformationViewController
            vc.loginInfo = user.login
        } else if segue.identifier == "Password" {
            let vc = segue.destination as! InformationViewController
            vc.passwordInfo = user.password
        } else {
            return
        }
}
    //MARK: - Keyboard Settings
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
            let nextTag = textField.tag + 1
            
            if let nextResponder = textField.superview?.viewWithTag(nextTag) {
                nextResponder.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
            return true
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeShown(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc func keyboardWillBeShown(notification: NSNotification) {
        guard let userInfo = notification.userInfo as? [String: Any],
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        let height = keyboardFrame.height
        
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
        
    
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
     
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
