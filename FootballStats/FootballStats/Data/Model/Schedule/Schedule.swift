//
//  Schedule.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 9/10/2023.
//

import Foundation

struct Schedule: Codable {
    var fixture: Fixture
    var teams: Teams
    var goals: Goals
    var league: FixtureLeague

    enum CodingKeys: String, CodingKey {
        case fixture
        case teams
        case goals
        case league
    }
}
