//
//  StatsRepository.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 9/10/2023.
//

import Foundation
import Alamofire
import RxSwift

protocol StatsRepository {
    func requestStats(input: StatsRequest) -> Observable<[Stats]>
}

final class StatsRepositoryImpl: StatsRepository {
    func requestStats(input: StatsRequest) -> Observable<[Stats]> {
        return APIService.shared.request(input: input)
            .map { (result: StatsResponse) in
                return result.response
            }
            .catchErrorJustReturn([])
    }
}
