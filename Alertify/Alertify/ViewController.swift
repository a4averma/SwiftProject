//
//  ViewController.swift
//  Alertify
//
//  Created by Aditya Verma on 06/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))
  
    override func viewDidLoad() {
        super.viewDidLoad()
        speechRecognizer?.delegate = self
        
    }

}

