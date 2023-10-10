//
//  PassStat.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 11/10/2023.
//

import Foundation

struct PassStat: Codable {
    var total: Int

    enum CodingKeys: String, CodingKey {
        case total
    }
}
