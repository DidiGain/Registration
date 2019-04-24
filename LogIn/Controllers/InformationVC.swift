//
//  InformationViewController.swift
//  LogIn
//
//  Created by Di Gain on 23/04/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit

class InformationVC: UIViewController {

//    var login: String!
//    var password: String!
    
   
    @IBOutlet weak var loginReminder: UILabel!
    @IBOutlet weak var passwordReminder: UILabel!
    
    loginReminder.text = "\(login)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
