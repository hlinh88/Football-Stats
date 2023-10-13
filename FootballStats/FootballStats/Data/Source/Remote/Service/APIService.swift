//
//  APIService.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 1/10/2023.
//

import UIKit
import Alamofire
import RxSwift

final class APIService {
    static let shared = APIService()

    private init() {}

    func request <T: Codable>(input: BaseRequest) -> Observable<T> {
        return Observable.create { observable in
            
            AF.request(input.url,
                       method: input.requestType,
                       parameters: input.parameter,
                       encoding: URLEncoding.default,
                       headers: input.headers)
                .response { (response) in
                    guard let data = response.data else { return }
                    let decoder = JSONDecoder()
                    do {
                        switch response.result {
                        case .success:
                            let returnedResponse = try decoder.decode(T.self, from: data)
                            observable.onNext(returnedResponse)
                            observable.onCompleted()
                        case .failure(let error):
                            observable.onError(error)
                        }
                    } catch {
                        observable.onError(error)
                    }
                }
            return Disposables.create()
        }
    }
}
