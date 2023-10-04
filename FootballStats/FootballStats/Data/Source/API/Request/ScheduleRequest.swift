//
//  ScheduleRequest.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 9/10/2023.
//
import Foundation
import Alamofire

final class ScheduleRequest: BaseRequest {
    required init() {
        let footballHeaders: HTTPHeaders = [
            "X-RapidAPI-Key": Constants.APIKey,
            "X-RapidAPI-Host": Constants.APIFootballHost
        ]
        let footballParameters = ["season": Constants.season,
                                  "league": Constants.leagueId]

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = Date().getCurrentDate()
        let lastweekDate = Date().getLastWeekDate()

        let dateParameter = ["to": dateFormatter.string(from: currentDate),
                             "from": dateFormatter.string(from: lastweekDate)]

        let parameter = footballParameters.merging(dateParameter, uniquingKeysWith: +)

        super.init(url: Endpoints.APIFixtureTwoDate,
                   requestType: .get,
                   parameter: parameter,
                   headers: footballHeaders)
    }
}
