//
//  TopPlayersResponse.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct TopPlayersResponse: Codable {
    var response: [TopPlayerResponse]

    enum CodingKeys: String, CodingKey {
        case response
    }
}

struct TopPlayerResponse: Codable {
    var player: Player
    var statistics: [Statistic]

    enum CodingKeys: String, CodingKey {
        case player, statistics
    }
}
