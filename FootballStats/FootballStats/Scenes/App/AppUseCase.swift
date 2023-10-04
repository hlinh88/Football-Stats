//
//  AppUseCase.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 8/10/2023.
//

import Foundation
import RxSwift
import RxCocoa

protocol AppUseCaseType {
    func getAPIKeys() -> Observable<Void>
}

struct AppUseCase: AppUseCaseType {
    func getAPIKeys() -> Observable<Void> {
        var keys: NSDictionary?
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        let APIKey = keys?["API_KEY"] as? String
        let APINewsHost = keys?["API_NEWS_HOST"] as? String
        let APIFootballHost = keys?["API_FOOTBALL_HOST"] as? String
        if let APIKey, let APINewsHost, let APIFootballHost {
            Constants.APIKey = APIKey
            Constants.APINewsHost = APINewsHost
            Constants.APIFootballHost = APIFootballHost
        }
        return Observable.just(())
    }
}
