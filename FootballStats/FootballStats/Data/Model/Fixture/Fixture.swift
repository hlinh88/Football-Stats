//
//  Fixture.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct Fixture: Codable {
    var date: String

    enum CodingKeys: String, CodingKey {
        case date
    }
}
