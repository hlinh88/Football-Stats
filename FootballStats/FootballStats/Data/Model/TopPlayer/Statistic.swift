//
//  Statistic.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct Statistic: Codable {
    var goals: Goal

    enum CodingKeys: String, CodingKey {
        case goals
    }
}
