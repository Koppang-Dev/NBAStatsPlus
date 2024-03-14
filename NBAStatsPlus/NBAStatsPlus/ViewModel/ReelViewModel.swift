//
//  ReelViewModel.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-09.
//

import Foundation
import UIKit


// Cases for the type of inputted media
enum Media {
    case video(URL)
    case image(URL)
}

class ReelViewModel {
    
    //MARK: Properties
    let reelModel = ReelModel()
     var currentIndex = 0

    
    private var mediaCount: Int {
        reelModel.getMediaCount()
    }
    
    //MARK: Functions
    
    // Gets Model to check for new media
    func updateMedia() {
        reelModel.updateMediaStructures()
    }
    
    // Returns the media count
    func getMediaCount() -> Int {
        return mediaCount
    }
    
    // Get next video URL
      func getNextMedia() -> Media? {

          guard currentIndex < reelModel.mediaList.count else {
              // No more media (reset count)
              currentIndex = 0
              return getNextMedia()
          }
          
          // Path to the current media
          let mediaPath = reelModel.mediaList[currentIndex]
          print(mediaPath)

          
          // Determine media type
          if mediaPath.hasSuffix(".mp4") {
              // Is a video
              let videoURL = URL(string: mediaPath)
              currentIndex += 1
              return .video(videoURL!)
     /*     } else if mediaPath.hasSuffix(".jpg"){
              // Is a image
              let imageURL = URL(string: mediaPath)
              currentIndex += 1
              return .image(imageURL!)
             */
          } else {
              // Not acceptable media
              currentIndex += 1
              return getNextMedia()
          }
      }
}
