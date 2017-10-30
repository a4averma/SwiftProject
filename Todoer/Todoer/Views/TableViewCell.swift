//
//  TableViewCell.swift
//  Todoer
//
//  Created by Aditya Verma on 03/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var listTitle: UILabel!
    
    @IBOutlet weak var listDescription: UILabel!
    
    @IBOutlet weak var listProgress: UILabel!
    
    func configureCell(description: String, title: String, progress: Int) {
        self.listTitle.text = title
        self.listDescription.text = description
        self.listProgress.text = String(describing: progress)
    }
}
