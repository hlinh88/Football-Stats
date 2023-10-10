//
//  GoalStat.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct GoalStat: Codable {
    var total: Int
    var assists: Int?

    enum CodingKeys: String, CodingKey {
        case total
        case assists
    }
}
