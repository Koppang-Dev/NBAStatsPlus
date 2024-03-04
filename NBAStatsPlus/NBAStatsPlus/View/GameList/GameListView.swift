//
//  GameListView.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-03.
//

import Foundation
import UIKit

class GameListView: UIViewController {
    
    //MARK: Initalizing UIComponents
    
    // Table View
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
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
        // datePicker.addTarget(self, action: #selector(dateChanged(sender:)), for: UIControl.Event.valueChanged)
        return datePicker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //MARK: Function Calls
        setupUI()
        
    }
    
    
    
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
}


//MARK: Tableview Datasource and Delegate
extension GameListView: UITableViewDataSource, UITableViewDelegate {
    
    // Number of games
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 10
    }
    
    
    
    // Specific cell information
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Creating Cell Instance
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GameListViewCell.identifier) as? GameListViewCell else {
            fatalError("The TableView could not Dequeue a CustomCell in GamesViewController")
        }
        
        return cell
        
        
        
    }
    
    
  
    
}
