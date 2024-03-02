//
//  OnboardingView.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-02.
//

import Foundation
import UIKit

class OnboardingView: UIViewController {
    
    //MARK: Variable Initalization
    let stackView = UIStackView()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    var currentBackgroundColour: UIColor = .white


    
    
    //MARK: Constructor
    init (imageName: String, titleText: String, subtitleText: String, viewColour: UIColor) {
        
        super.init(nibName: nil, bundle: nil)
        
        // Initalizing the UIComponents components
        self.currentBackgroundColour = viewColour
        imageView.image = UIImage(named: imageName)
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
    }
    
    /*
     Required when the class conforms to NSCoding protocol or loads objects from an archieve
     Fatal error will stop the program and output the message
     This signals that instances of this view contoller should not be instantiated from an archieve
        and if someone tries to do so, the program will terminate with a fatal error
     Archive Terminology:
        - Process of converting objects and data structures into a format that can be stored persistently
        - Often used to save the states to a disk and involves incoding the objects into a serialized format
     */
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension OnboardingView {
    
    //MARK:  Style Function
    func style() {
        // Stack View UI
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        
        // ImageView UI
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit // Image scaled within the bounds (Maintain aspect ratio)
        
        // TitleLabel UI
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        // Subtitle Label UI
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        
        // Setting the background colour for the current viewcontroller
        view.backgroundColor = currentBackgroundColour
    }
    
    
    // MARK: Layout Function
    func layout() {
        // Adding UI components to UIView
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        view.addSubview(stackView)
        
        // Manually Setting Constraints
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            subtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: subtitleLabel.trailingAnchor, multiplier: 2),
        ])
    }
}
