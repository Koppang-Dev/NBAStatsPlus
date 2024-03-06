//
//  StandingInformationModel.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-05.
//

import Foundation


// Parent Struct
struct StandingResponse: Decodable {
    var standing: [StandingInformation]
}

// Information about standings (from API)
struct StandingInformation: Decodable {
    var NAME: String
    var winpercent: String
    var ranking: String
    var games_back: String
    var wins: String
    var loses: String
    var conference: String
}



