//
//  StandingAPIService.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-05.
//

import Foundation

class StandingAPIService {
    
    // Creating Singleton instance
    public static let sharedStandingAPI = StandingAPIService()
    private init() {}
    
    // API Standing Information Fetch
    public func fetchGameInformation(URL url: String, completion: @escaping (StandingResponse?) ->Void) {
        
        // Create URL object
        guard let url = URL(string: url) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        // Creating URL session
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) {data, response, error in
            // Check for errors
            if let error = error {
                print("Error retrieving Standings Information")
                completion(nil)
                return
            }
            
            // Check for data
            guard let data = data else {
                print("No Data For Standings")
                completion(nil)
                return
            }
            
            // Decoding Information
            do {
                let parsingData = try JSONDecoder().decode(StandingResponse.self, from: data)
            } catch {
                print("Error Parsing JSON data")
                completion(nil)
            }
        }
        dataTask.resume() // Beginning network request
        
        
        
        
        
    }
        

    
    
}
