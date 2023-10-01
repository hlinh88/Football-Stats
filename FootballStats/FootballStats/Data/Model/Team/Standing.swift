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

    enum CodingKeys: String, CodingKey {
        case rank, team
    }
}
