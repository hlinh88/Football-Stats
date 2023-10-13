//
//  SchedulesResponse.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct SchedulesResponse: Codable {
    var response: [Schedule]

    enum CodingKeys: String, CodingKey {
        case response
    }
}
