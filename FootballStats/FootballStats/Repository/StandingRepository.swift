//
//  StandingRepository.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 4/10/2023.
//

import Foundation
import Alamofire
import RxSwift

protocol StandingRepository {
    func requestStanding(input: StandingRequest) -> Observable<[Standing]>
}

final class StandingRepositoryImpl: StandingRepository {
    func requestStanding(input: StandingRequest) -> Observable<[Standing]> {
        var standings = [Standing]()

        return APIService.shared.request(input: input)
            .map { (result: StandingsResponse) in
                _ = result.response.map { $0.league.standings.map { standings.append(contentsOf: $0) } }
                return standings
            }
            .catchErrorJustReturn([])
    }
}
