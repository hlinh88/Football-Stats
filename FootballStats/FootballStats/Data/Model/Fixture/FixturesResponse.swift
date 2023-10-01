//
//  FixturesResponse.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import Foundation

struct FixturesResponse: Codable {
    var response: [FixtureResponse]

    enum CodingKeys: String, CodingKey {
        case response
    }
}

struct FixtureResponse: Codable {
    var fixture: Fixture
    var teams: Teams
    var goals: Goals

    enum CodingKeys: String, CodingKey {
        case fixture, teams, goals
    }
}
