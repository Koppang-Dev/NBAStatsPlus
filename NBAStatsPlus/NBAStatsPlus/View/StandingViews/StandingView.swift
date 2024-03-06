//
//  StandingView.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-05.
//

import Foundation
import UIKit


class StandingView: UIViewController {
    
    //MARK: Properties
    let standingViewModel = StandingViewModel()
    
    private var standingData: StandingInformation? = nil {
        didSet {
            DispatchQueue.main.async {
                // Tableview has to be reloaded using the main thread
                self.tableView.reloadData() // Reload the table view whenever gameData is updated
            }
        }
    }
    
    
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
    
    
    //MARK: Setup UI
    private func setupUI() {
        // Adding the TableView
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        // Adding the segmented control
        self.view.addSubview(segmentControl)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding wins column header
        self.view.addSubview(winsColumnHeader)
        winsColumnHeader.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding losses column header
        self.view.addSubview(lossesColumnHeader)
        lossesColumnHeader.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding PCT column header
        self.view.addSubview(pctColumnHeader)
        pctColumnHeader.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding GB column header
        self.view.addSubview(GBColumnHeader)
        GBColumnHeader.translatesAutoresizingMaskIntoConstraints = false
        
        // Setting the constraints for everything
        NSLayoutConstraint.activate([
            
            // Setting constraints for segmented control first
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            segmentControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            // 'W' Column header
            winsColumnHeader.topAnchor.constraint(equalTo: self.segmentControl.bottomAnchor, constant: 15),
            winsColumnHeader.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 10),
            
            // 'L' Column Header
            lossesColumnHeader.topAnchor.constraint(equalTo: self.segmentControl.bottomAnchor, constant: 15),
            lossesColumnHeader.leadingAnchor.constraint(equalTo: winsColumnHeader.trailingAnchor, constant: 30),
            
            // 'PCT' Column Header
            pctColumnHeader.topAnchor.constraint(equalTo: self.segmentControl.bottomAnchor, constant: 15),
            pctColumnHeader.leadingAnchor.constraint(equalTo: lossesColumnHeader.trailingAnchor, constant: 30),
            
            // 'GB' Column Header
            GBColumnHeader.topAnchor.constraint(equalTo: self.segmentControl.bottomAnchor, constant: 15),
            GBColumnHeader.leadingAnchor.constraint(equalTo: pctColumnHeader.trailingAnchor, constant: 30),
            
            
            
            tableView.topAnchor.constraint(equalTo: self.segmentControl.bottomAnchor, constant: 30),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    // Displays the standings information
    private func fetchStandingsInformation() {
        standingViewModel.fetchStandingsInformation(completion: {standings, error in
            
            if let error = error {
                // There are errors
                print("Error Fetching Standing Information")
                return
            } else if let standings = standings {
                // Standing information is retrieved
               // self.standingData = standings
            }
            
            
        })
        
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

// MARK: Tableview Delegate and Data Source
extension StandingView: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell Instance
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StandingCell.identifier) as? StandingCell else {
            fatalError("The TableView could not Dequeue a CustomCell in StandingView")
        }
        
        // Current Standings Information
        
        
        
        return cell
        
        
    }
    
    
    
}
