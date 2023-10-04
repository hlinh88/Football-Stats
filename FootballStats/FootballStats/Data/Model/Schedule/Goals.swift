//
//  Goals.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct Goals: Codable {
    var home: Int
    var away: Int

    enum CodingKeys: String, CodingKey {
        case home
        case away
    }
}
