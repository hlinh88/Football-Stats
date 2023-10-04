//
//  TopPlayersResponse.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct TopPlayersResponse: Codable {
    var response: [TopPlayer]

    enum CodingKeys: String, CodingKey {
        case response
    }
}
