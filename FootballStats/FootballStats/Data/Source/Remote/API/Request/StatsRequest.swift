//
//  StatsRequest.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 9/10/2023.
//
import Foundation
import Alamofire

final class StatsRequest: BaseRequest {
    required init(category: String) {
        let footballHeaders: HTTPHeaders = [
            "X-RapidAPI-Key": Constants.APIKey,
            "X-RapidAPI-Host": Constants.APIFootballHost
        ]

        let footballParameters = ["season": Constants.season,
                                  "league": Constants.leagueId]

        let url = Endpoints.APIStats + category

        super.init(url: url,
                   requestType: .get,
                   parameter: footballParameters,
                   headers: footballHeaders)
    }
}
