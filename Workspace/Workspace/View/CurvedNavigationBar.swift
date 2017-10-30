//
//  CurvedNavigationBar.swift
//  Todoer
//
//  Created by Aditya Verma on 05/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import UIKit

var screenWidth: CGFloat = UIScreen.main.bounds.size.width
var height = (UIScreen.main.bounds.size.height/2) / 1.35049253

class CurvedNavigationBar: UINavigationBar {
    
    var pathLayer: CAShapeLayer?
    init() {
        super.init(frame: CGRect.zero)
        
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    func setup() {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0.5, y: 0.5))
        bezierPath.addLine(to: CGPoint(x: screenWidth, y: 0.5))
        bezierPath.addLine(to: CGPoint(x: screenWidth, y: 226.5))
        bezierPath.addCurve(to: CGPoint(x: 187, y: 249.5), controlPoint1: CGPoint(x: screenWidth, y: 226.5), controlPoint2: CGPoint(x: 280.5, y: 249.5))
        bezierPath.addCurve(to: CGPoint(x: 0.5, y: 226.5), controlPoint1: CGPoint(x: 93.5, y: 249.5), controlPoint2: CGPoint(x: 0.5, y: 226.5))
        bezierPath.addLine(to: CGPoint(x: 0.5, y: 0.5))
        UIColor.black.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        //let translation = CGSize(width: 375, height: 42.5)

        //bezierPath.apply(CGAffineTransform(translationX: translation.width, y: translation.height))
        pathLayer = CAShapeLayer()
        pathLayer?.fillColor = UIColor.white.cgColor
        pathLayer?.path = bezierPath.cgPath
        pathLayer?.lineWidth = 1.0
        pathLayer?.shadowOffset = CGSize(width: 0, height: 9)
        pathLayer?.strokeColor = UIColor.white.cgColor
        pathLayer?.shadowRadius = 7
        pathLayer?.shadowOpacity = 0.3
        pathLayer?.shadowColor = UIColor.darkGray.cgColor
        layer.addSublayer(pathLayer!)
        
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        title.text = "For You"
        title.textAlignment = .center
        title.frame.origin = CGPoint(x: UIScreen.main.bounds.size.width/2, y: self.frame.height/2)
        self.addSubview(title)
        
    }
    
}

