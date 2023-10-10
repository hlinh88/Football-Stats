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
    var nationality: String
    var birth: Birth
    var age: Int
    var height: String
    var weight: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo
        case nationality
        case birth
        case age
        case height
        case weight
    }
}
