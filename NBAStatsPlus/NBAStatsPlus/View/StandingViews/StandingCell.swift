//
//  StandingCell.swift
//  NBAStats
//
//  Created by Riley on 2024-01-03.
//

import UIKit

class StandingCell: UITableViewCell {
    
    // Setting the Identifier
    static let identifier = "StandingCell"
    
    
    //MARK: UI COMPONENTS DECLARATION
    // Setting the team name label
    private let teamNameLabel: UILabel = {
        let teamNameLabel = UILabel()
        teamNameLabel.textColor = .label
        teamNameLabel.textAlignment = .left
        teamNameLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 14)
        teamNameLabel.text = "Error" // Default text if not set
        teamNameLabel.numberOfLines = 0
        return teamNameLabel
    }()
    
    // Setting the team names current ranking number
    private let rankingLabel: UILabel = {
        let rankingLabel = UILabel()
        rankingLabel.text = "0" // Place Holder Text
        rankingLabel.font = .systemFont(ofSize: 12, weight: .bold)
        rankingLabel.numberOfLines = 0
        rankingLabel.textAlignment = .center
        rankingLabel.textColor = .systemBlue
        rankingLabel.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1.0)
        rankingLabel.frame.size = CGSize(width: 30, height: 30) // Initalizing the size
        rankingLabel.layer.cornerRadius = rankingLabel.bounds.width / 2.0
        rankingLabel.clipsToBounds = true
        return rankingLabel
    }()
    
    // Setting the team's image
    private let teamImage: UIImageView = {
        let teamImage = UIImageView()
        teamImage.contentMode = .scaleAspectFit
        teamImage.image = UIImage(systemName: "questionmark") // Default cell image
        teamImage.tintColor = .label // Colour depends on the interface style (dark vs light)
        return teamImage
    }()
    
    // Setting the team's win amount
    private let winLabel: UILabel = {
        let winLabel = UILabel()
        winLabel.text = "0" // Place Holder Text
        winLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        winLabel.numberOfLines = 0
        winLabel.textAlignment = .center
        winLabel.textColor = .black
        return winLabel
    }()
    
    // Setting the team's loss amount
    private let lossLabel: UILabel = {
        let lossLabel = UILabel()
        lossLabel.text = "0" // Place Holder Text
        lossLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        lossLabel.numberOfLines = 0
        lossLabel.textAlignment = .center
        lossLabel.textColor = .black
        return lossLabel
    }()
    
    // Setting the win percent label
    private let winPercentLabel: UILabel = {
        let winPercentLabel = UILabel()
        winPercentLabel.text = "0" // Place Holder Text
        winPercentLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        winPercentLabel.numberOfLines = 0
        winPercentLabel.textAlignment = .center
        winPercentLabel.textColor = .black
        return winPercentLabel
    }()
    
    
    // Setting the team's games_back amount
    private let gamesBackLabel: UILabel = {
        let gamesBackLabel = UILabel()
        gamesBackLabel.text = "0" // Place Holder Text
        gamesBackLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        gamesBackLabel.numberOfLines = 0
        gamesBackLabel.textAlignment = .center
        gamesBackLabel.textColor = .black
        return gamesBackLabel
    }()
    
    
    
    
    
    
    
    /*
     Method is the initalizer for the custom UITabelView subclass
     */
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //MARK: UI Function Calls
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Setting the current cells team name
    public func setTeamName(teamName: String) {
        self.teamNameLabel.text = teamName
    }
    
    // Setting the team's ranking number
    public func setRankingNumber(currentRowNumber: Int) {
        rankingLabel.text = "\(currentRowNumber)"
    }
    
    // Setting the team's image
    public func setTeamImage(image: UIImage) {
        teamImage.image = image
    }
    
    // Setting the team's win and losses
    public func setWinsLosses(wins: Int, losses: Int) {
        winLabel.text = String(wins)
        lossLabel.text = String(losses)
    }
    
    // Setting the teams' win percentage label
    public func setWinPercent(winPercent: Float) {
        winPercentLabel.text = String(format: "%.2f", winPercent)
    }
    
    // Setting the team's games back
    public func setGamesBack(gamesBack: Float) {
        gamesBackLabel.text = String(gamesBack)
    }
    
    
    // Setting up the UI configuration
    private func setupUI() {
        
        // Ranking Label
        self.contentView.addSubview(rankingLabel)
        rankingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Team Image
        self.contentView.addSubview(teamImage)
        teamImage.translatesAutoresizingMaskIntoConstraints = false
        
        // Team Name Label
        self.contentView.addSubview(teamNameLabel)
        teamNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Team's Total Wins
        self.contentView.addSubview(winLabel)
        winLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Team's Total Losses
        self.contentView.addSubview(lossLabel)
        lossLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Team's total games back
        self.contentView.addSubview(gamesBackLabel)
        gamesBackLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Win Percent Label
        self.contentView.addSubview(winPercentLabel)
        winPercentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Setting Anchor Constraints
        NSLayoutConstraint.activate([
            
            // Ranking Label
            rankingLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0),
            rankingLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            rankingLabel.widthAnchor.constraint(equalToConstant: 30),
            rankingLabel.heightAnchor.constraint(equalToConstant: 30),
            
            // Team Image
            teamImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            teamImage.leadingAnchor.constraint(equalTo: self.rankingLabel.trailingAnchor, constant: 10),
            teamImage.widthAnchor.constraint(equalToConstant: 50),
            teamImage.heightAnchor.constraint(equalToConstant: 50),

            
            // Team Name Label
            teamNameLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 8),
            teamNameLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor, constant: -8),
            teamNameLabel.leadingAnchor.constraint(equalTo: self.teamImage.layoutMarginsGuide.trailingAnchor, constant: 15),
            
            // Total Wins Label
            winLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 8),
            winLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor, constant: -8),
            winLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 10),
            
            // Total Loses Label
            lossLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 8),
            lossLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor, constant: -8),
            lossLabel.leadingAnchor.constraint(equalTo: self.winLabel.layoutMarginsGuide.trailingAnchor, constant: 32),
            
            // Win Percent Label
            winPercentLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 8),
            winPercentLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor, constant: -8),
            winPercentLabel.leadingAnchor.constraint(equalTo: self.lossLabel.layoutMarginsGuide.trailingAnchor, constant: 40),
            
            // Games Back Label
            gamesBackLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 8),
            gamesBackLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor, constant: -8),
            gamesBackLabel.leadingAnchor.constraint(equalTo: self.rankingLabel.layoutMarginsGuide.trailingAnchor, constant: 305)
        ])
        
    }
    
    
    
}

