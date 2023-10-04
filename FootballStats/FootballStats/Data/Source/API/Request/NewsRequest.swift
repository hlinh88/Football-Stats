//
//  NewsRequest.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 9/10/2023.
//

import Foundation
import Alamofire

final class NewsRequest: BaseRequest {
    required init() {
        let newsHeaders: HTTPHeaders = [
            "X-RapidAPI-Key": Constants.APIKey,
            "X-RapidAPI-Host": Constants.APINewsHost
        ]

        super.init(url: Endpoints.APINewsBaseURL,
                   requestType: .get,
                   parameter: [:],
                   headers: newsHeaders)
    }
}
