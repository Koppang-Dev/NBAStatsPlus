//
//  GameListView.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-03.
//

import Foundation
import UIKit

class GameListView: UIViewController {
    
    //MARK: Properties
    private let gameViewModel = GameViewModel() // ViewModel Instance

    private var gameData: [GameInformation] = [] {
        didSet {
            DispatchQueue.main.async {
                // Tableview has to be reloaded using the main thread
                self.tableView.reloadData() // Reload the table view whenever gameData is updated
            }
        }
    }
    
    //MARK: Initalizing UIComponents
    
    // Table View
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = false
        tableView.register(GameListViewCell.self, forCellReuseIdentifier: GameListViewCell.identifier)
        return tableView
    }()
    
    // Date Picker
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.locale = .current
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.tintColor = .systemBlue
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //MARK: Function Calls
        setupUI()
        addTargets()
        fetchGameInformation()
        setupRefreshControls()
    }
    
    //MARK: SetupUI
    private func setupUI() {
        self.view.backgroundColor = .white
        
        // Tableview
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // Date Picker
        view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        // Manually Setting Constraints
        NSLayoutConstraint.activate([
            
            // Table view constraints
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 130),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            // Date Calander Constraints
            datePicker.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -15),
            datePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    private func addTargets() {
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
    
    //MARK: Fetch Game Information
    func fetchGameInformation(forDate date: Date? = nil) {
        // Data is defaulted to nil
        let currentDate = date ?? Date()
        
        gameViewModel.fetchGameData(forDate: currentDate) { [weak self] games, error in
            // Check if self has been deallocated
            guard let self = self else {return}
            
            // Check for errors
            if error != nil {
                print("Error fetching data")
                return
            } else if let games = games {
                // Game information is available
                self.gameData = games
            }
        }
    }
}


//MARK: Tableview Datasource and Delegate
extension GameListView: UITableViewDataSource, UITableViewDelegate {
    
    // Number of games
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameData.count
    }
    
    // Specific cell information
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Creating Cell Instance
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GameListViewCell.identifier) as? GameListViewCell else {
            fatalError("The TableView could not Dequeue a CustomCell in GamesViewController")
        }
        
        // Current Game Information
        let game = gameData[indexPath.row]
        
        // Setting Cell Information
        cell.configureScore(homeTeamScore: game.home_team_score, awayTeamScore: game.visitor_team_score)
        cell.configureStatus(gameStartTime: game.status, period: game.period, periodTime: game.time)
        cell.configureTeamNames(homeTeamName: game.home_team.name, awayTeamName: game.visitor_team.name)
        cell.configureTeamImages(homeTeamImage: UIImage(named: game.home_team.name)!, awayTeamImage: UIImage(named: game.visitor_team.name)!)
        
        // Returning cell
        return cell
    }
}



//MARK: Refresh Control Initalization
extension GameListView {
    
    // Adding refresh control to UI
    func setupRefreshControls() {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Updating NBA Scores")
        refreshControl.addTarget(self, action: #selector(refreshTriggered(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    // Handling when refresh is triggered
    @objc func refreshTriggered(_ sender: UIRefreshControl) {
        tableView.reloadData()
        sender.endRefreshing()
    }
}

//MARK: Data Changer Functions
extension GameListView {
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        fetchGameInformation(forDate: sender.date)
    }
    
}
