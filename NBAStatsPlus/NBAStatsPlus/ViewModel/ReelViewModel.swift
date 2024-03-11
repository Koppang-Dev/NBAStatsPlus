//
//  ReelViewModel.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-09.
//

import Foundation


class ReelViewModel {
    
    //MARK: Properties
    let reelModel = ReelModel()
    private var currentIndex = 0

    
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
      func getNextVideoURL() -> URL? {
          
          print("HERE: ", reelModel.mediaList.count)
          guard currentIndex < reelModel.mediaList.count else {
              return nil
          }
          
          let videoPath = reelModel.mediaList[currentIndex]
          
          // Check if it is a correct URL
          guard let videoURL = URL(string: videoPath) else {
              print("Invalid URL")
              return nil
          }
          currentIndex += 1
          return videoURL
      }
    
    
    
    
}
