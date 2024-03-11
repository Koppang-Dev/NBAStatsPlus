//
//  ReelsView.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-09.
//

import Foundation
import UIKit

class ReelsView: UIViewController {
    
    //MARK: Properties
    let reelViewModel = ReelViewModel()
    
    // UICollection View
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.register(ReelsCell.self, forCellWithReuseIdentifier: ReelsCell.identifier)
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        collectionView.dataSource = self
        
        //MARK: Function Calls
        reelViewModel.updateMedia()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       collectionView.frame = view.bounds
        
    }
    
    
    //MARK: Setup UI
    private func setupUI() {
        
        // Set item size here because view.frame is available
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.itemSize = CGSize(width: view.frame.size.width,
                                         height: view.frame.size.height)
            }
        
        // Adding UI Components to subview
        view.addSubview(collectionView)
        
        // Manually Setting Constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // Setting Constraints
        NSLayoutConstraint.activate([
            
            // Collection View Constraints
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
}


//MARK: Collectionview Datasource
extension ReelsView: UICollectionViewDataSource {
    
    // Number of items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Returns the amount of videos saved
        return reelViewModel.getMediaCount()
    }
    
    
    // Alter specific cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCell.identifier, for: indexPath) as! ReelsCell
        
        // Get the next video URL from the viewModel
        if let videoURL = reelViewModel.getNextVideoURL() {
            print(videoURL)
            // Configure the cell with the video URL
            cell.configure(with: videoURL)
        } else {
            // If there are no more videos, you can handle it accordingly
            print("No more videos to play.")
        }
        return cell
    }
    
    
}

