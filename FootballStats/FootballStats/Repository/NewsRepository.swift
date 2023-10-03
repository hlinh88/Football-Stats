//
//  NewsRepository.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 3/10/2023.
//

import Foundation
import Alamofire

protocol NewsRepository {
    func requestNews(completion: @escaping ([News]?, Error?) -> Void)
}

final class NewsRepositoryImpl: NewsRepository {
    
    func requestNews(completion: @escaping ([News]?, Error?) -> Void) {
        let newsHeaders: HTTPHeaders = [
            "X-RapidAPI-Key": Constants.APIKey,
            "X-RapidAPI-Host": Constants.APINewsHost
        ]
        APIService.shared.request(url: Endpoints.APINewsBaseURL, method: .get, parameters: [:], headers: newsHeaders) { (returnedResponse: [News]!, error: Error?) in
            if error != nil {
                completion(nil, error)
            } else {
                completion(returnedResponse, nil)
            }
        }
    }

}
