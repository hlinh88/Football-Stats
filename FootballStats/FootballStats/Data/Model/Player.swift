//
//  Player.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct Player: Codable {
    var id: Int
    var name: String
    var photo: String

    enum CodingKeys: String, CodingKey {
        case id, name, photo
    }
}
