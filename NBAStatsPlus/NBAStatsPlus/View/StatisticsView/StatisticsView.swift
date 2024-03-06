//
//  StatisticsView.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-06.
//


/*
 
 Make a collection view that houses 3 levels:
    - Basic Stats (Points, Assists, Rebounds, Steals, Blocks)
    - Odd Calculation (MVP, Defensive Player, ROTY, Champion, 6MOTY)
    - Betting Calc?
 */

import Foundation
import UIKit


class StatisticsView: UIViewController {
    
    //MARK: UI Components
    private let basicStatsCollectionView: UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.scrollDirection = .horizontal
        // Collectionview
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        //collectionView.register(AddDeviceCell.self, forCellWithReuseIdentifier: AddDeviceCell.identifier)
        return collectionView
    }()
    
    private let oddsCollectionView: UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.scrollDirection = .horizontal
        // Collectionview
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        //collectionView.register(AddDeviceCell.self, forCellWithReuseIdentifier: AddDeviceCell.identifier)
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Function Calls
        initalizeCollectionViews()
        setupUI()
    }
    
    private func setupUI() {
        
        // Adding to view
        view.addSubview(basicStatsCollectionView)
        
        // Set Manual Constraints
        basicStatsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Setting Constraints
        NSLayoutConstraint.activate([
            basicStatsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            basicStatsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            basicStatsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            basicStatsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    
    // CollectionView Initalization
    private func initalizeCollectionViews() {
        basicStatsCollectionView.dataSource = self
        basicStatsCollectionView.delegate = self
        oddsCollectionView.dataSource = self
        oddsCollectionView.delegate = self
    }
}


//MARK: Collectionview Datasource and Delegate
extension StatisticsView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    // Items in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == basicStatsCollectionView {
            // Pts, assists, rebounds, steals, fouls
            return 5
        } else {
            // collectionView == oddsCollectionView (MVP, Champion, ROTY, DPOY)
            return 4
        }
    }
    
    
    
    
    // Configuring Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == basicStatsCollectionView {
            // Configure for basic stats
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddDeviceCell.identifier, for: indexPath) as? AddDeviceCell else {
                fatalError("Failed to dequeue AddDeviceCell")
            }
        } else {
            // Configure for odds
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddDeviceCell.identifier, for: indexPath) as? AddDeviceCell else {
                fatalError("Failed to dequeue AddDeviceCell")
            }
            
        }
        
    }
    
    
}
