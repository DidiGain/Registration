//
//  WelcomeVC.swift
//  LogIn
//
//  Created by Di Gain on 24/04/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    var login: String!
    @IBOutlet weak var loginName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let login = login else { return }
        
        loginName.text = login
    }
}
