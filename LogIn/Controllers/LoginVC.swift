//
//  ViewController.swift
//  LogIn
//
//  Created by Di Gain on 23/04/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit

let user = UserInfo()

class LoginVC: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
 
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
            let vc = segue.destination as! WelcomeVC
            vc.login = loginTextField.text
        } else if segue.identifier == "Login" {
            let vc = segue.destination as! InformationVC
            vc.loginInfo = user.login
        } else if segue.identifier == "Password" {
            let vc = segue.destination as! InformationVC
            vc.passwordInfo = user.password
        } else {
            return
        }
}
    //MARK: - Keyboard Settings
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @objc func updateForKeyboard(notification: Notification) {
        guard
            let userInfo = notification.userInfo as? [String: Any],
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            else { return }

        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardFrame.height
        }
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y += keyboardFrame.height
        }

    }
    
    override func viewDidLoad() {
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(updateForKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(updateForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
   

}
