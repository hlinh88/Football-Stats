//
//  MatchStats.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 4/10/2023.
//

import Foundation

struct MatchStats: Codable {
    var played: Int
    var win: Int
    var draw: Int
    var lose: Int
    
    enum CodingKeys: String, CodingKey {
        case played
        case win
        case draw
        case lose
    }
}
