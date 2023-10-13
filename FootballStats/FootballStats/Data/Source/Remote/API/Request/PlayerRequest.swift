//
//  PlayerRequest.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 13/10/2023.
//

import Foundation
import Alamofire

final class PlayerRequest: BaseRequest {
    required init(id: Int) {
        let footballHeaders: HTTPHeaders = [
            "X-RapidAPI-Key": Constants.APIKey,
            "X-RapidAPI-Host": Constants.APIFootballHost
        ]

        let footballParameters = ["season": Constants.season,
                                  "league": Constants.leagueId,
                                  "id": String(id)]

        super.init(url: Endpoints.APIStats,
                   requestType: .get,
                   parameter: footballParameters,
                   headers: footballHeaders)
    }
}
