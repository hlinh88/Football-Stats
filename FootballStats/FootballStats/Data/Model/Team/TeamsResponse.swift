//
//  TeamsResponse.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct TeamsResponse: Codable {
    var response: [TeamResponse]

    enum CodingKeys: String, CodingKey {
        case response
    }
}

struct TeamResponse: Codable {
    var league: League

    enum CodingKeys: String, CodingKey {
        case league
    }
}
