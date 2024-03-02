//
//  AuthenticationTopView.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-02.
//

import Foundation
import UIKit

class AuthenticationTopView: UIView {
    
    // Called when instance is created
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    // Called when instance is loaded
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}



// MARK: UI Function Declarations
extension AuthenticationTopView {
    
    // Initalizing the Bezier Path
    func setupView() {
        
        // Initalizing the defined path
        let path: UIBezierPath = getPath()
        
        //CAShapeLayer used to manage and create shapes
        let shape = CAShapeLayer()
        
        // Core Graphs Representation Path
        shape.path = path.cgPath
        
        // Setting UI components of the path
        shape.lineWidth = 2.0
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.white.cgColor
        
        // Adding the shadow components
        shape.shadowColor = UIColor.black.cgColor
        shape.shadowPath = path.cgPath
        shape.shadowOffset = CGSize(width: 0.0, height : -5.0)
        shape.shadowOpacity = 0.5
        shape.shadowRadius = 20
        
        // Adding the Shape to the layer
        self.layer.addSublayer(shape)
    }
    
    func getPath() -> UIBezierPath {
        
        // Intialize instance of UIBezier Path
        let path: UIBezierPath = UIBezierPath()
        
        // Setting the starting point of the path: Does not draw anything
        path.move(to: CGPoint(x: 150, y: 210))
        
        // Drawing the top line
        path.addLine(to: CGPoint(x: 370, y: 210))
        
        // Drawing the right line
        path.addLine(to: CGPoint(x: 370, y: 700))
        
        // Drawing the bottom right curve
        path.addQuadCurve(to: CGPoint(x: 290, y: 790), controlPoint: CGPoint(x: 370, y: 790))

        // Drawing the bottom line
        path.addLine(to: CGPoint(x: 25, y: 790))
        
        // Drawing the left side
        path.addLine(to: CGPoint(x: 25, y: 310))
        
        // Adding the top left curve
        path.addQuadCurve(to: CGPoint(x: 150, y: 210), controlPoint: CGPoint(x: 25, y: 210))
        
        // Completing the drawing
        path.close()
        
        // Returning our path
        return path
    }
}

//MARK: Shadow Extension
extension AuthenticationTopView {
    func applyShadow() {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowOffset = CGSize(width: 0.0, height: -5.0)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 1
    }
}


