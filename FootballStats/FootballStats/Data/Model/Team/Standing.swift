//
//  Standing.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct Standing: Codable {
    var rank: Int
    var team: Team
    var points: Int
    var goalsDiff: Int
    var all: MatchStats

    enum CodingKeys: String, CodingKey {
        case rank
        case team
        case points
        case goalsDiff
        case all
    }
}
