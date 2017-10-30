//
//  ViewController.swift
//  Chat
//
//  Created by Aditya Verma on 29/09/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func run(_ sender: Any) {
        DataService.instance.amizoneConnector(username: usernameField.text!, password: passwordField.text!)
    }
    


}

