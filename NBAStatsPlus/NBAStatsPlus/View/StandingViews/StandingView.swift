//
//  StandingView.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-05.
//

import Foundation
import UIKit


class StandingView: UIViewController {
    
    //MARK: Initalizing UI Components
    
    // Initalizing the table view
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.allowsSelection = false // User can not select individual rows
        tableView.register(StandingCell.self, forCellReuseIdentifier: StandingCell.identifier)
        tableView.separatorStyle = .none // Removes row lines
        return tableView
    }()
    
    // Initalizing the column headers
    
    // W column Header
    private let winsColumnHeader: UILabel = {
        let winsColumnHeader = UILabel()
        winsColumnHeader.text = "W" // Place Holder Text
        winsColumnHeader.font = .systemFont(ofSize: 12, weight: .bold)
        winsColumnHeader.numberOfLines = 0
        winsColumnHeader.textAlignment = .center
        winsColumnHeader.textColor = .lightGray
        return winsColumnHeader
    }()
    
    // L column header
    private let lossesColumnHeader: UILabel = {
        let lossesColumnHeader = UILabel()
        lossesColumnHeader.text = "L" // Place Holder Text
        lossesColumnHeader.font = .systemFont(ofSize: 12, weight: .bold)
        lossesColumnHeader.numberOfLines = 0
        lossesColumnHeader.textAlignment = .center
        lossesColumnHeader.textColor = .lightGray
        return lossesColumnHeader
    }()

    
    // PCT column header
    private let pctColumnHeader: UILabel = {
        let pctColumnHeader = UILabel()
        pctColumnHeader.text = "PCT" // Place Holder Text
        pctColumnHeader.font = .systemFont(ofSize: 12, weight: .bold)
        pctColumnHeader.numberOfLines = 0
        pctColumnHeader.textAlignment = .center
        pctColumnHeader.textColor = .lightGray
        return pctColumnHeader
    }()
    
    // GB column header
    private let GBColumnHeader: UILabel = {
        let GBColumnHeader = UILabel()
        GBColumnHeader.text = "GB" // Place Holder Text
        GBColumnHeader.font = .systemFont(ofSize: 12, weight: .bold)
        GBColumnHeader.numberOfLines = 0
        GBColumnHeader.textAlignment = .center
        GBColumnHeader.textColor = .lightGray
        return GBColumnHeader
    }()
    
    // Segment Control
    private let segmentControl: UISegmentedControl = {
        let items = ["Eastern", "Western", "League"] // Headers
        let control = UISegmentedControl(items: items)
        control.selectedSegmentTintColor = .white
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Function Calls
        
    }
    
    
    private func addTargets() {
        segmentControl.addTarget(self, action: #selector(standingsTabChanged(_:)), for: .valueChanged)
    }
    
    
}

//MARK: @objc functions
extension StandingView {
    
    // When the header is changed, show the requested standing information
    @objc func standingsTabChanged(_ sender: UISegmentedControl) {
        
    }
}
