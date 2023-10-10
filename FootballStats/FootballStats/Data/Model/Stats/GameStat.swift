//
//  GameStat.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 10/10/2023.
//

import Foundation

struct GameStat: Codable {
    var appearences: Int
    var position: String

    enum CodingKeys: String, CodingKey {
        case appearences
        case position
    }
}
