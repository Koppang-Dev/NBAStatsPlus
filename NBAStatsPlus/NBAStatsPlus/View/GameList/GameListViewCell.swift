//
//  CustomCell.swift
//  NBAStats
//
//  Created by Riley on 2023-12-31.
//

import UIKit

class GameListViewCell: UITableViewCell {
    
    // View Model instance
    private let gameViewModel = GameViewModel()
    
    // Identifier to be used by TableView
    static let identifier = "GameListCell"
    
    
    //MARK: Variable Initalization
    
    // Home Team Image
    private let homeTeamImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark") // Default cell image
        iv.tintColor = .label // Colour depends on the interface style (dark vs light)
        return iv
    }()
    
    // Away Team Image
    private let awayTeamImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark") // Default cell image
        iv.tintColor = .label // Colour depends on the interface style (dark vs light)
        return iv
    }()

   
    // Home Team Score label
    private let homeScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "" // Default text if not set
        return label
    }()
    
    // Away Team Score Label
    private let awayScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "" // Default text if not set
        return label
    }()
    
    // Game time label
    private let gameTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "Error" // Default text if not set
        return label
    }()
    
    // Home team name
    private let homeTeamLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.text = "Error" // Default text if not set
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    // Away team name
    private let awayTeamLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.text = "Error" // Default text if not set
        return label
    }()
    
    // Status Label (Ex. "VS" "Final" "88-52"
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Error" // Default text if not set
        label.adjustsFontSizeToFitWidth =  true
        return label
    }()
    
    // Full Score Label (55 vs 72)
    private let fullScore: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Error" // Default text if not set
        label.adjustsFontSizeToFitWidth =  true
        return label
    }()
    
    
    
    // Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Setting Team Images
    func configureTeamImages(homeTeamImage: UIImage, awayTeamImage: UIImage) {
        self.homeTeamImageView.image = homeTeamImage
        self.awayTeamImageView.image = awayTeamImage
    }
    
    
    // Setting Team Names
    func configureTeamNames(homeTeamName: String, awayTeamName: String) {
        homeTeamLabel.text = homeTeamName
        homeTeamLabel.adjustsFontSizeToFitWidth = true
        awayTeamLabel.text = awayTeamName
        awayTeamLabel.adjustsFontSizeToFitWidth = true
    }
    
    // Setting the score
    func configureScore(homeTeamScore: Int, awayTeamScore: Int) {
        self.homeScoreLabel.text = String(homeTeamScore)
        self.awayScoreLabel.text = String(awayTeamScore)
    }
    
    // Setting the status label
    func configureStatus(gameStartTime: String, period: Int, periodTime: String?) {
    
        if period == 0 {
            // Game has not started
            statusLabel.text = gameViewModel.modifyDateFormat(dateInput: gameStartTime)
            homeScoreLabel.isHidden = true
            awayScoreLabel.isHidden = true
        } else {
            // Game is/has happened
            homeScoreLabel.isHidden = false
            awayScoreLabel.isHidden = false
            
            if periodTime == "Final" {
                // Game is over (Empty string means game is over)
                statusLabel.text = "Final"
            } else {
                // Game is currently Underway
                statusLabel.text = "VS"
            }
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
        
        // Away Team Image
        self.contentView.addSubview(awayTeamImageView)
        awayTeamImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Away Team Name
        self.contentView.addSubview(awayTeamLabel)
        awayTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Status Label
        self.contentView.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Home Score
        self.contentView.addSubview(homeScoreLabel)
        homeScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Away Score
        self.contentView.addSubview(awayScoreLabel)
        awayScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Manually Setting Constraints
        NSLayoutConstraint.activate([
            
            // Home Team Image View
            homeTeamImageView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 8),
            homeTeamImageView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor, constant: -30),
            homeTeamImageView.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor, constant: 20),
            homeTeamImageView.heightAnchor.constraint(equalToConstant: 60),
            homeTeamImageView.widthAnchor.constraint(equalToConstant: 60),
            
            // Home Team Name Label
            homeTeamLabel.topAnchor.constraint(equalTo: homeTeamImageView.bottomAnchor, constant: 10), // Below Image
            homeTeamLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            homeTeamLabel.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor, constant: 0),
           // homeTeamLabel.centerXAnchor.constraint(equalTo: homeTeamImageView.centerXAnchor),
            homeTeamLabel.heightAnchor.constraint(equalToConstant: 25),
            homeTeamLabel.widthAnchor.constraint(equalToConstant: 100),
            
            // Status Label
            statusLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            statusLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            
            // Home Score
            homeScoreLabel.trailingAnchor.constraint(equalTo: statusLabel.leadingAnchor, constant: -16),
            homeScoreLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            homeScoreLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            // Away Score
            awayScoreLabel.leadingAnchor.constraint(equalTo: statusLabel.trailingAnchor, constant: 16),
            awayScoreLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            awayScoreLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            
            // Away Team Image View
            awayTeamImageView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 8),
            awayTeamImageView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor, constant: -30),
            awayTeamImageView.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor, constant: -20),
            awayTeamImageView.widthAnchor.constraint(equalToConstant: 60),
            awayTeamImageView.heightAnchor.constraint(equalToConstant: 60),
            
            // Away Team Name Label
            awayTeamLabel.topAnchor.constraint(equalTo: awayTeamImageView.bottomAnchor, constant: 10), // Below Image
            awayTeamLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            awayTeamLabel.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor, constant:  0),
            awayTeamLabel.centerXAnchor.constraint(equalTo: awayTeamImageView.centerXAnchor),
            awayTeamLabel.heightAnchor.constraint(equalToConstant: 25),
            awayTeamLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}

