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
    
    // UICollection View
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        collectionView.dataSource = self
    }
}


//MARK: Collectionview Datasource
extension ReelsView: UICollectionViewDataSource {
    
    // Number of items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    // Alter specific cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCell.identifier, for: indexPath)
        
        return cell
    }
    
    
}

