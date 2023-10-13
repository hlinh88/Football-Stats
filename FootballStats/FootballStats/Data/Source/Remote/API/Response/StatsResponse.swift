//
//  StatsResponse.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct StatsResponse: Codable {
    var response: [Stats]

    enum CodingKeys: String, CodingKey {
        case response
    }
}
