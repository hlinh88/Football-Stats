//
//  PlayerRepository.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 13/10/2023.
//

import Foundation
import Alamofire
import RxSwift

protocol PlayerRepository {
    func requestPlayer(input: PlayerRequest) -> Observable<[Stats]>
}

final class PlayerRepositoryImpl: PlayerRepository {
    func requestPlayer(input: PlayerRequest) -> Observable<[Stats]> {
        return APIService.shared.request(input: input)
            .map { (result: StatsResponse) in
                return result.response
            }
            .catchErrorJustReturn([])
    }
}
