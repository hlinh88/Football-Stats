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
        let saveFavouriteTrigger: Driver<Stats>
        let deleteFavouriteTrigger: Driver<Int>
    }

    struct Output {
        let records: Driver<[String]>
        let stats: Driver<Stats>
        let indicator: Driver<Bool>
        let isFollow: Driver<Bool>
        let saveFavourite: Driver<Void>
        let deleteFavourite: Driver<Void>
    }

    func transform(_ input: DetailViewModel.Input, disposeBag: DisposeBag) -> DetailViewModel.Output {
        let indicator = ActivityIndicator()

        let stats = BehaviorRelay<Stats>(value: thisStat)

        let records = BehaviorRelay<[String]>(value: [])

        if let statistic = self.thisStat.statistics[safe: 0] {
            let recordStats = [String(statistic.games.appearences),
                               String(statistic.goals.total),
                               String(statistic.passes.total),
                               String(statistic.shots.total ?? 0)]
            records.accept(recordStats)
        }

        input.backTrigger
            .drive(onNext: navigator.backToScreen)
            .disposed(by: disposeBag)

        let isFollow = input.loadTrigger
            .flatMapLatest {
                return self.useCase.checkFavouriteExist(id: thisStat.player.id)
                    .asDriver(onErrorDriveWith: .empty())
            }

        let saveFavourite = input.saveFavouriteTrigger
            .flatMapLatest { stat in
               return self.useCase.saveFavourite(thisStat: stat)
                    .asDriver(onErrorDriveWith: .empty())
            }

        let deleteFavourite = input.deleteFavouriteTrigger
            .flatMapLatest { id in
               return self.useCase.deleteFavourite(id: id)
                    .asDriver(onErrorDriveWith: .empty())
            }

        return Output(
            records: records.asDriver(),
            stats: stats.asDriver(),
            indicator: indicator.asDriver(),
            isFollow: isFollow,
            saveFavourite: saveFavourite,
            deleteFavourite: deleteFavourite
        )
    }
}
