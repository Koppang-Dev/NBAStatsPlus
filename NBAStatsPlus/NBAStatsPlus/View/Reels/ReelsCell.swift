//
//  ReelsCell.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-09.
//

import UIKit
import AVFoundation

class ReelsCell: UICollectionViewCell {
    
    //MARK: Properties
    static let identifier = "ReelsCell"
    
    // Subviews
    var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    
    // Override init method
     override init(frame: CGRect) {
         super.init(frame: frame)
         
         //MARK: Function Calls
         setupPlayer()
         
         self.backgroundColor = .orange
         contentView.backgroundColor = .clear
         contentView.clipsToBounds =  true
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    
    private func setupPlayer() {
        player = AVPlayer()
        // Initalizing PlayerLayer
        let playerView = AVPlayerLayer()
        playerView.player = player
        playerView.frame = contentView.bounds
        contentView.layer.addSublayer(playerView)
    }
    
    // Sets screen as the inputted video URL
    func configure(with videoURL: URL) {
        let playerItem = AVPlayerItem(url: videoURL)
        player?.replaceCurrentItem(with: playerItem)
        player?.volume = 0
        player?.play()
    }
}
