//
//  ViewController.swift
//  Workspace
//
//  Created by Aditya Verma on 05/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: CurvedNavigationBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func changeSize(_ sender: Any) {
        let height: CGFloat = -200 //whatever height you want
        let bounds = self.navigationBar.bounds
        self.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    


}

