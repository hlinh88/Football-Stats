//
//  Statistic.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct Statistic: Codable {
    var goals: GoalStat
    var cards: CardStat
    var team: Team
    var games: GameStat
    var passes: PassStat
    var shots: ShotStat

    enum CodingKeys: String, CodingKey {
        case goals
        case cards
        case team
        case games
        case passes
        case shots
    }
}
