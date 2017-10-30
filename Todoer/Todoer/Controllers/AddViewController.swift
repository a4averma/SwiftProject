//
//  AddViewController.swift
//  Todoer
//
//  Created by Aditya Verma on 03/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var nextButton: NextButton!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
