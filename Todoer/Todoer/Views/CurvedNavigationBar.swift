//
//  CurvedNavigationBar.swift
//  Todoer
//
//  Created by Aditya Verma on 04/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import UIKit


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
        bezierPath.move(to: CGPoint(x: 0.0, y: 31.47))
        bezierPath.addCurve(to: CGPoint(x: 186.72, y: 42.5), controlPoint1: CGPoint(x: 0.5, y: 31.47), controlPoint2: CGPoint(x: 93.22, y: 42.5))
        bezierPath.addCurve(to: CGPoint(x: 375, y: 31.47), controlPoint1: CGPoint(x: 280.22, y: 42.5), controlPoint2: CGPoint(x: 375, y: 31.47))
        bezierPath.addLine(to: CGPoint(x: 375, y: -0.5))
        bezierPath.addLine(to: CGPoint(x: 0.5, y: -0.5))
        bezierPath.addLine(to: CGPoint(x: 0.0, y: 31.47))
//        UIColor.black.setStroke()
//        bezierPath.lineWidth = 1
//        bezierPath.stroke()
        
        pathLayer = CAShapeLayer()
        pathLayer?.fillColor = UIColor.white.cgColor
        pathLayer?.path = bezierPath.cgPath
        pathLayer?.lineWidth = 1.0
//        pathLayer?.strokeColor = UIColor.black.cgColor
        layer.addSublayer(pathLayer!)
        
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        title.text = "For You"
        title.textAlignment = .center
        title.center = self.center
        addSubview(title)
    }

}
