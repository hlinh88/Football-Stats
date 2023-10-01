//
//  Goal.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct Goal: Codable {
    var total: Int

    enum CodingKeys: String, CodingKey {
        case total
    }
}
