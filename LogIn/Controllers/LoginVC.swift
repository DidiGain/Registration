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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    
    @IBAction func remindLoginPressed(_ sender: UIButton) {
         performSegue(withIdentifier: "Reminder", sender: nil)
        
    }
  
    
    @IBAction func remindPasswordPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "Reminder", sender: nil)
    }
    
    func alertMessage(message: String) {
        let ac = UIAlertController(title: "Try again", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        ac.addAction(ok)
        present(ac, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? WelcomeVC else { return }
        dvc.login = loginTextField.text
    }
    
   
    
    
}

