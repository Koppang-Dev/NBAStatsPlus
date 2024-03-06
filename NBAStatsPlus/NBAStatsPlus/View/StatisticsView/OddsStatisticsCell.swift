//
//  OddsStatisticsCell.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-06.
//

import UIKit

class OddsStatisticsCell: UICollectionViewCell {
    
    //MARK: Properties
    static let identifier = "OddsStatisticsCell"
    
    //MARK: UI Components
    
    // Cell Image
    private let cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Cell Label
    private let cellLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "SFDisplay", size: 18)
        return label
    }()
    
    // Override init method
     override init(frame: CGRect) {
         super.init(frame: frame)
         setupUI()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    
    private func setupUI() {
        
        // Cell Layer
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.layer.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0).cgColor
        self.backgroundColor = .lightGray
        
        // Adding UI components to cell
        self.addSubview(cellImage)
        self.addSubview(cellLabel)
        
        // Manually Setting Constraints
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Setting Constraints
        NSLayoutConstraint.activate([
            
            // Image
            cellImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cellImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            cellImage.widthAnchor.constraint(equalToConstant: 120),
            cellImage.heightAnchor.constraint(equalToConstant: 150),
            
            // Label
            cellLabel.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 0),
            cellLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            cellLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            cellLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
        
    }
}
