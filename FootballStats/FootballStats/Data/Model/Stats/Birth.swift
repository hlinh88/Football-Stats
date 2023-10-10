//
//  Birth.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 10/10/2023.
//

import Foundation

struct Birth: Codable {
    var date: String

    enum CodingKeys: String, CodingKey {
        case date
    }
}
