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
    var imageView: UIImageView?
    private var playerView: AVPlayerLayer?
    
    
    // Override init method
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: Function Calls
        setupPlayer()
        setupImageView()
        
        
        self.backgroundColor = .black
        contentView.backgroundColor = .black
        contentView.clipsToBounds =  true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Initalizing the ImageView
    private func setupImageView() {
        imageView = UIImageView(frame: self.bounds)
        imageView?.contentMode = .scaleAspectFill
        contentView.addSubview(imageView!)
        imageView?.clipsToBounds = true
        
        imageView?.translatesAutoresizingMaskIntoConstraints = false
             NSLayoutConstraint.activate([
                 imageView!.topAnchor.constraint(equalTo: contentView.topAnchor),
                 imageView!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                 imageView!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                 imageView!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
             ])
    }
    
    
    // Initalizing the Player
    private func setupPlayer() {
        player = AVPlayer()
        // Initalizing PlayerLayer
        playerView = AVPlayerLayer()
        playerView!.player = player
        playerView!.frame = self.bounds
        playerView!.videoGravity = .resizeAspectFill
        contentView.layer.addSublayer(playerView!)
     }
    
    func configureVideo(with url: URL) {
        imageView?.isHidden = true
        playerView?.isHidden = false
        let playerItem = AVPlayerItem(url: url)
        player?.replaceCurrentItem(with: playerItem)
        player?.volume = 0
        player?.play()
        // Adding loop to the videos
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
    }
    
    // In ReelsCell.swift
    func configureImage(with imageURL: URL) {
        // Load image from URL
        if let image = UIImage(contentsOfFile: imageURL.path) {
            imageView?.image = image
            // Hide player layer when showing image
            playerView?.isHidden = true
        } else {
            print("Failed to load image from URL: \(imageURL)")
        }
    }
    
    
    
    // Restarting videos when they finish
    @objc private func playerDidFinishPlaying(notification: Notification) {
        // Put player to the beggining to loop the video
        player?.seek(to: CMTime.zero)
        player?.play()
    }
}
