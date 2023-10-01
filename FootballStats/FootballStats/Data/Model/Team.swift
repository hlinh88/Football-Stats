//
//  Team.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct Team: Codable {
    var id: Int
    var name: String
    var logo: String

    enum CodingKeys: String, CodingKey {
        case id, name, logo
    }
}
