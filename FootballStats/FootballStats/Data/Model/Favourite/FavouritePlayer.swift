//
//  FavouritePlayer.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 12/10/2023.
//

import Foundation

struct FavouritePlayer: Codable {
    var id: Int
    var playerName: String
    var playerImage: String
    var clubName: String
    var clubLogo: String

    enum CodingKeys: String, CodingKey {
        case id
        case playerName
        case playerImage
        case clubName
        case clubLogo
    }
}
