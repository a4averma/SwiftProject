//
//  NextButton.swift
//  Todoer
//
//  Created by Aditya Verma on 03/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import UIKit

class NextButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 8.0
        layer.masksToBounds = false
        
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 12
        layer.shadowOffset = CGSize(width: 1.0, height: 5.0)
    }

}
