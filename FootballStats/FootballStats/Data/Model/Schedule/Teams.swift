//
//  Teams.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct Teams: Codable {
    var home: Team
    var away: Team

    enum CodingKeys: String, CodingKey {
        case home
        case away
    }
}
