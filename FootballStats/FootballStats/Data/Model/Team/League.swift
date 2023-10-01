//
//  League.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct League: Codable {
    var name: String
    var standings: [[Standing]]

    enum CodingKeys: String, CodingKey {
        case name, standings
    }
}
