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
        //tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
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
        //MARK: Function Calls
        setupUI()
        
    }
    
    
    
    private func setupUI() {
        
        
    }
}
