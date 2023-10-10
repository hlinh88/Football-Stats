//
//  StatsUseCase.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 9/10/2023.
//

import Foundation
import RxSwift

protocol StatsUseCaseType {
    func getStats(category: String) -> Observable<[Stats]>
}

struct StatsUseCase: StatsUseCaseType {
    func getStats(category: String) -> Observable<[Stats]> {
        return StatsRepositoryImpl().requestStats(input: StatsRequest(category: category))
    }
}
