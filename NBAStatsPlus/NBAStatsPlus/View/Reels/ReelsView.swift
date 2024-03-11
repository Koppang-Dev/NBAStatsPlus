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
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.register(ReelsCell.self, forCellWithReuseIdentifier: ReelsCell.identifier)
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        collectionView.dataSource = self
        
        //MARK: Function Calls
        reelViewModel.updateMedia()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .black
        
    }
    
    
    //MARK: Setup UI
    private func setupUI() {
        
        // Set item size here because view.frame is available
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.itemSize = CGSize(width: view.bounds.width,
                                         height: view.bounds.height)
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
        
        // Get the next media from the viewModel
        if let media = reelViewModel.getNextMedia() {
            // Configure the cell with the media from ViewModel Enum
            switch media {
            case .video(let url):
                cell.configureVideo(with: url)
            case .image(let url):
                cell.configureImage(with: url)
            }
        } else {
            // If there are no more videos, you can handle it accordingly
            print("No more media to show.")
        }
        return cell
    }
    
    
}

