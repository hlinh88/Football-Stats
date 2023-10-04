//
//  StandingRequest.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 9/10/2023.
//

import Foundation
import Alamofire

final class StandingRequest: BaseRequest {
    required init() {
        let footballHeaders: HTTPHeaders = [
            "X-RapidAPI-Key": Constants.APIKey,
            "X-RapidAPI-Host": Constants.APIFootballHost
        ]

        let footballParameters = ["season": Constants.season,
                                  "league": Constants.leagueId]

        super.init(url: Endpoints.APITeamRankingURL,
                   requestType: .get,
                   parameter: footballParameters,
                   headers: footballHeaders)
    }
}
