//
//  APIService.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 1/10/2023.
//

import UIKit
import Alamofire

final class APIService {
    static let shared = APIService()

    private init() {}
    
    func request <T: Codable> (url: String,
                               method: HTTPMethod,
                               parameters: [String: Any],
                               headers: HTTPHeaders,
                               completion: @escaping (T?, Error?) -> Void) {
        AF.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .response { (response) in
                guard let data = response.data else { return }
                let decoder = JSONDecoder()
                do {
                    switch response.result {
                    case .success:
                        let returnedResponse = try decoder.decode(T.self, from: data)
                        completion(returnedResponse, nil)
                    case .failure(let error):
                        completion(nil, error)
                    }
                } catch {
                    completion(nil, error)
                }
            }
    }
}
