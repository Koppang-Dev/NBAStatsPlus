//
//  CustomCell.swift
//  NBAStats
//
//  Created by Riley on 2023-12-31.
//

/*

 */

import UIKit

class CustomCell: UITableViewCell {
    
    /*
     Static indicates that the property is associated with the type itself rather than an instance of the type
        - The variable belongs to the class and is called with the class name
        - CustomCell.identifier
     */
    static let identifier = "CustomCell"
    
    
    /*
     Example of a closure to create and configure an instance of UIImageView()
     */
    private let homeTeamImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark") // Default cell image
        iv.tintColor = .label // Colour depends on the interface style (dark vs light)
        return iv
    }()
    
    private let awayTeamImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark") // Default cell image
        iv.tintColor = .label // Colour depends on the interface style (dark vs light)
        return iv
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Error" // Default text if not set
        return label
    }()
    
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "Error" // Default text if not set
        return label
    }()
    
    private let gameTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "Error" // Default text if not set
        return label
    }()
    
    private let homeTeamLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.text = "Error" // Default text if not set
        return label
    }()
    
    private let awayTeamLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.text = "Error" // Default text if not set
        return label
    }()
    
    
    /*
     Method is the initalizer for the custom UITabelView subclass
     
     */
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func configure(homeTeamImage: UIImage, awayTeamImage: UIImage, label: String) {
        self.homeTeamImageView.image = homeTeamImage
        self.awayTeamImageView.image = awayTeamImage
        self.myLabel.text = label
    }
    
    // Initalizing the team names to be placed under the team's logo
    public func configureTeamNames(homeTeamName: String, awayTeamName: String) {
        homeTeamLabel.text = homeTeamName
        homeTeamLabel.adjustsFontSizeToFitWidth = true
        awayTeamLabel.text = awayTeamName
        awayTeamLabel.adjustsFontSizeToFitWidth = true
    }
    
    public func configureScore(homeTeamScore: Int, awayTeamScore: Int, gameStartTime: String?, period: String) {
        
        // If the game has not started
        if (homeTeamScore == -1 && awayTeamScore == -1) {
            scoreLabel.text = gameStartTime
            scoreLabel.adjustsFontSizeToFitWidth = true
            
        // The game is currently underway
        } else {
            
            /*
             Creating an attributed string
             "Final" will be a smaller font then the final game scores
             */
            let attributedText = NSMutableAttributedString()

            // Add home team score with a larger font
            let homeTeamScoreString = NSAttributedString(string: "\(homeTeamScore) ", attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 23, weight: .bold)
            ])
            attributedText.append(homeTeamScoreString)

            // Add "FINAL" with a smaller font
            
            if period == "Final" {
                let finalString = NSAttributedString(string: "FINAL ", attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular)
                ])
                attributedText.append(finalString)
            } else {
                let finalString = NSAttributedString(string: "VS ", attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular)
                ])
                attributedText.append(finalString)
            }

            // Add away team score with a larger font
            let awayTeamScoreString = NSAttributedString(string: "\(awayTeamScore)", attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 23, weight: .bold)
            ])
            attributedText.append(awayTeamScoreString)

            // Set the attributed text to the label
            scoreLabel.attributedText = attributedText
        }
    }
    
    
    
    
    // Function for setting the custom cell UI
    private func setupUI() {
        
        // Home Team ImageView
        self.contentView.addSubview(homeTeamImageView)
        homeTeamImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Home Team Label
        self.contentView.addSubview(homeTeamLabel)
        homeTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Score Label
        self.contentView.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Away Team Image
        self.contentView.addSubview(awayTeamImageView)
        awayTeamImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Away Team Name
        self.contentView.addSubview(awayTeamLabel)
        awayTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            
            /* Setting the constraints for the ImageView */
            
            /*
             Content View:
                - Property of the UITableViewCell
                - Represents the primary container view for the content of a table view cell
             LayoutMarginsGuide:
                - Represents an area inside the view's bounds that is reserved for layout margins
             */
            
            
            
            // Home Team Image View
            homeTeamImageView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 8),
            homeTeamImageView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor, constant: -30),
            homeTeamImageView.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            homeTeamImageView.heightAnchor.constraint(equalToConstant: 60),
            homeTeamImageView.widthAnchor.constraint(equalToConstant: 60),
            
            // Home Team Name Label
            homeTeamLabel.topAnchor.constraint(equalTo: homeTeamImageView.bottomAnchor, constant: 10), // Below Image
            homeTeamLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            homeTeamLabel.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            homeTeamLabel.heightAnchor.constraint(equalToConstant: 25),
            homeTeamLabel.widthAnchor.constraint(equalToConstant: 60),
            
            // Score Label
            scoreLabel.leadingAnchor.constraint(equalTo: self.homeTeamImageView.trailingAnchor, constant: 16),
            scoreLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            scoreLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            scoreLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            scoreLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            
            // Away Team Image View
            awayTeamImageView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 8),
            awayTeamImageView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor, constant: -30),
            awayTeamImageView.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor),
            awayTeamImageView.widthAnchor.constraint(equalToConstant: 60),
            awayTeamImageView.heightAnchor.constraint(equalToConstant: 60),
            
            // Away Team Name Label
            awayTeamLabel.topAnchor.constraint(equalTo: awayTeamImageView.bottomAnchor, constant: 10), // Below Image
            awayTeamLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            awayTeamLabel.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor),
            awayTeamLabel.heightAnchor.constraint(equalToConstant: 25),
            awayTeamLabel.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    
    
}

