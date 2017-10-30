//
//  ViewController.swift
//  Todoer
//
//  Created by Aditya Verma on 03/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {

    @IBOutlet weak var navigationBar: CurvedNavigationBar!
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    
    }

    @IBAction func addButtonWasPressed(_ sender: Any) {
        
    }
    

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listCell") as? TableViewCell else { return UITableViewCell() }
        
        cell.configureCell(description: "Works", title: "Brush Teeth", progress: 6)
        return cell
    }
    
}

