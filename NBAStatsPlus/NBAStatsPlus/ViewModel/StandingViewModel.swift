//
//  StandingViewModel.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-05.
//

import Foundation

class StandingViewModel {
    
    //MARK: API Standings Fetch
    func fetchStandingsInformation(URL url: String, completion: @escaping ((StandingResponse?), Error?) -> Void) {
        
        
        
    }
    
    
        
    //MARK: Merge Sort Functions
    // Merges east and west standings and sorts by wins (Desending)
    func mergeSortLeagueStandings(league: [StandingInformation]) -> [StandingInformation] {
        
        // Base Case
        if (league.count == 1) {
            return league
        }
        
        // Getting the middle index
        var middleIndex: Int
        middleIndex = league.count / 2
        
        // Defining Left and Right Array
        var leftArray = Array(league[0..<middleIndex])
        var rightArray = Array(league[middleIndex..<league.count])
        
        // Keep Splitting the pairs
        leftArray = mergeSortLeagueStandings(league: leftArray)
        rightArray = mergeSortLeagueStandings(league: rightArray)
        
        return mergeLeagueStandings(leftArray: leftArray, rightArray: rightArray)
    }
    
    // Returns the pair ordered
    func mergeLeagueStandings(leftArray: [StandingInformation], rightArray: [StandingInformation]) -> [StandingInformation] {
        
        // Variable Declaration
        var mergedList: [StandingInformation] = []
        var leftArray = leftArray
        var rightArray = rightArray
        
        // Converting win percentage to float
        var leftArrayValue = Float(leftArray.first!.winpercent)!
        var rightArrayValue = Float(rightArray.first!.winpercent)!
        
        
        // If both arrays still have element
        // Check which win percentage is greater
        while(leftArray.count > 0 && rightArray.count > 0) {
            
            // Defining the current win percentage
            leftArrayValue = Float(leftArray.first!.winpercent)!
            rightArrayValue = Float(rightArray.first!.winpercent)!
            
            // Comparision
            if (leftArrayValue > rightArrayValue) {
                mergedList.append(leftArray.removeFirst())
            } else {
                mergedList.append(rightArray.removeFirst())
            }
        }
        
        // If left array only has elements
        while (leftArray.count > 0) {
            leftArrayValue = Float(leftArray.first!.winpercent)!
            mergedList.append(leftArray.removeFirst())
        }
        
        // If right array only has elements
        while (rightArray.count > 0) {
            rightArrayValue = Float(rightArray.first!.winpercent)!
            mergedList.append(rightArray.removeFirst())
        }
        
        // Return the ordered pair
        return mergedList
    }
}
