//
//  InformationViewController.swift
//  LogIn
//
//  Created by Di Gain on 23/04/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

    var loginInfo: String!
    var passwordInfo: String!
    
    @IBOutlet weak var loginReminder: UILabel!
    @IBOutlet weak var passwordReminder: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginReminder.text = loginInfo
        passwordReminder.text = passwordInfo
    }

}
