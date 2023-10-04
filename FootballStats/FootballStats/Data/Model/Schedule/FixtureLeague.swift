//
//  FixtureLeague.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 4/10/2023.
//

import Foundation

struct FixtureLeague: Codable {
    var round: String

    enum CodingKeys: String, CodingKey {
        case round
    }
}
