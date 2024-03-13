//
//  VideoModel.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-09.
//

import Foundation


class ReelModel {
    
    var mediaList = [String]()
    private var mediaCount = 0;
    
    
    // Updates necessary data structures and variables
    func updateMediaStructures() {
        
        // URL of the outer DownloadMedia directory
        let innerDownloadMediaURL = Bundle.main.bundleURL.appendingPathComponent("nba")

        // URL of the inner DownloadMedia directory
       // let innerDownloadMediaURL = outerDownloadMediaURL.appendingPathComponent("DownloadedMedia")
          
        do {
            // Get the contents of DownloadMedia folder
            let contents = try FileManager.default.contentsOfDirectory(at: innerDownloadMediaURL, includingPropertiesForKeys: nil)
            
            for media in contents {
                // Check if the URL points to an image or video
                let mediaTypes = ["jpg", "jpeg", "mp4", "mov"]
                if  mediaTypes.contains(media.pathExtension.lowercased()) {
                    print("ADDED ONE")
                    mediaList.append(media.absoluteString)
                }
            }
        } catch {
            // An Error Occured
            print("Error: Could not find innerDownloadMediaURL")
        }
    }
    
    
    // Returning Media Count
    func getMediaCount() -> Int {
        return mediaList.count
    }

    
    
    
    
}
