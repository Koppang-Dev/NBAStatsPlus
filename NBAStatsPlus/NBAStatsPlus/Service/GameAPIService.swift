//
//  GameAPI.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-03.
//

import Foundation

class GameAPIService {
    
    // Creating Singleton Instance
    public static let sharedGameAPI = GameAPIService()
    private init() {}
    
    public func fetchGameInformation(URL url: String, completion: @escaping (GameListResponse?) ->Void) {
        
        // Create URL object
        guard let url = URL(string: url) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let apiKey = "56b9282f-7bf4-419f-9cc3-288484501f2e"
        // Creating API Request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(apiKey , forHTTPHeaderField: "Authorization")
        
        // Starting URL Session
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) {data, response, error in
            
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
            
            // Print raw data as string
             if let dataString = String(data: data, encoding: .utf8) {
                 print("Raw data received: \(dataString)")
             } else {
                 print("Unable to convert data to string")
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
