//
//  GameInformationModel.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-03.
//

import Foundation

// Parent struct that contains the game/team data and meta data
struct GameListResponse: Decodable {
    let data: [GameInformation]
    let meta: MetaInformation?
    
    // Convenience Initalizer
    init() {
        self.data = []
        self.meta = nil
    }
}

// Object that contains specific information about the Meta Data
struct MetaInformation: Decodable {
    let current_page: Int
    let next_page: Int?
    let per_page: Int
}

// Contains specific game information
struct GameInformation: Decodable {
    let id: Int
    let date: String
    let home_team_score: Int
    let visitor_team_score: Int
    let season: Int
    let period: Int
    let status: String
    let time: String? // Optional becomes some games start later
    let postseason: Bool
    let home_team: TeamInformation
    let visitor_team: TeamInformation
}

// Object that contains information about the specific team
struct TeamInformation: Decodable {
    let id: Int
    let abbreviation: String
    let city: String
    let conference: String
    let division: String
    let full_name: String
    let name: String
}

