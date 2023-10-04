//
//  Venue.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 4/10/2023.
//

import Foundation

struct Venue: Codable {
    var name: String

    enum CodingKeys: String, CodingKey {
        case name
    }
}
