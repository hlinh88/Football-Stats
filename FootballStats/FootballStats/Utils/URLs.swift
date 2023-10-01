//
//  URLs.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 1/10/2023.
//

import Foundation

struct Endpoints {
    private static var newsDomain = "https://football-news-aggregator-live.p.rapidapi.com"
    private static var footballDomain = "https://api-football-v1.p.rapidapi.com"
    public static var APINewsBaseURL = newsDomain + "/news/espn"
    public static var APITeamRankingURL = footballDomain + "/v3/standings"
    public static var APITopPlayer = footballDomain + "/v3/players/"
    public static var APIFixtureTwoDate = footballDomain + "/v3/fixtures"
}
