//
//  GameAPI.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-03.
//

import Foundation

class GameAPIService {
    
    // Creating Singleton Instance
    public static let shared = GameAPIService()
    private init() {}
    
    public func fetchGameInformation(URL url: String, completion: @escaping (GameListResponse?) ->Void) {
        
        // Create URL object
        guard let url = URL(string: url) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        // Starting URL Session
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) {data, response, error in
            
            // Check for errors
            if let error = error {
                print("Error fetching information \(error)")
                completion(nil)
                return
            }
            
            // Check if data is available
            guard let data = data else {
                print("Error retrieving information")
                completion(nil)
                return
            }
            
            // Decode
            do {
                let result = try JSONDecoder().decode(GameListResponse.self, from: data)
                completion(result)
            } catch {
                print("Error parsing JSON \(error)")
                completion(nil)
            }
        }
        // Begin Task
        dataTask.resume()
    }
}
