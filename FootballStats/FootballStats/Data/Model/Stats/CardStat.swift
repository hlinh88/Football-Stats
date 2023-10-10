//
//  CardStat.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 9/10/2023.
//

import Foundation

struct CardStat: Codable {
    var yellow: Int
    var red: Int

    enum CodingKeys: String, CodingKey {
        case yellow
        case red
    }
}
