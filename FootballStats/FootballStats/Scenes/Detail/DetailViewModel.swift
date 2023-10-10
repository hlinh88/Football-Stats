//
//  DetailViewModel.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 10/10/2023.
//

import Foundation
import RxSwift
import RxCocoa
import RxSwiftUtilities

struct DetailViewModel {
    let navigator: DetailNavigatorType
    let useCase: DetailUseCaseType
    let thisStat: Stats
}

extension DetailViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
        let backTrigger: Driver<Void>
    }

    struct Output {
        let records: Driver<[String]>
        let stats: Driver<Stats>
        let indicator: Driver<Bool>
    }

    func transform(_ input: DetailViewModel.Input, disposeBag: DisposeBag) -> DetailViewModel.Output {
        let indicator = ActivityIndicator()
        
        let stats = BehaviorRelay<Stats>(value: thisStat)

        let records = BehaviorRelay<[String]>(value: [])

        if self.thisStat.statistics.isNotEmpty {
            if let statistic = self.thisStat.statistics[safe: 0] {
                let recordStats = [String(statistic.games.appearences),
                                   String(statistic.goals.total),
                                   String(statistic.passes.total),
                                   String(statistic.shots.total ?? 0)]
                records.accept(recordStats)
            }
        }

        input.backTrigger
            .do(onNext: navigator.backToScreen)
            .drive()
            .disposed(by: disposeBag)

        return Output(
            records: records.asDriver(),
            stats: stats.asDriver(),
            indicator: indicator.asDriver()
        )
    }
}
