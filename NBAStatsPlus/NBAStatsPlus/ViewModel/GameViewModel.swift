//
//  GameViewModel.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-03.
//

import Foundation


class GameViewModel {
    
    // Gets Game API data for current date
    func fetchGameData(forDate date: Date, completion: @escaping ([GameInformation]?, Error?) -> Void) {
        // Relevent Data Information and Formatting
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        
        
        let currentDate = Date()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Converting to this date format
        let todayDateString = dateFormatter.string(from: currentDate)
        let apiUrl = "https://www.balldontlie.io/api/v1/games?dates[]=\(todayDateString)"
                
        // Fetch API information from Service Layer
        GameAPIService.shared.fetchGameInformation(URL: apiUrl, completion: {gameListResponse in
            
            if let gameListResponse = gameListResponse {
                // Data is retrieved
                completion(gameListResponse.data, nil)
            } else {
                // Return with error
                let error = NSError(domain: "YourDomain", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch game data"])
                completion(nil, error)
            }
        })
    }
}

