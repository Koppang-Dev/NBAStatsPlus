//
//  TextFieldHelper.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-14.
//

import Foundation
import UIKit

class TextFieldHelper {
    
    // Create the textfields
    public func createTextfield(text: String, imageName: String) -> UITextField {
        let textField = UITextField()
        let image = UIImage(systemName: imageName)
        textField.setLeftView(image: image!)
        
        let attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        textField.attributedPlaceholder = attributedPlaceholder
        textField.textAlignment = .center
        textField.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        textField.layer.cornerRadius = 15
        textField.textColor = .black
        textField.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        textField.widthAnchor.constraint(equalToConstant: 300).isActive =  true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive =  true
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }
    
}
