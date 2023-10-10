//
//  StatsViewModel.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 9/10/2023.
//

import Foundation
import RxRelay
import RxSwift
import RxCocoa
import RxSwiftUtilities

struct StatsViewModel {
    var useCase: StatsUseCaseType
    var navigator: StatsNavigatorType
}

extension StatsViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
        let selectTrigger: Driver<IndexPath>
    }

    struct Output {
        let topscorers: Driver<[Stats]>
        let indicator: Driver<Bool>
        let topFour: Driver<[Stats]>
    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let indicator = ActivityIndicator()

        let topFour = BehaviorRelay<[Stats]>(value: [])
        let scheduler = SerialDispatchQueueScheduler(qos: .background)

        let scorers = self.useCase.getStats(category: CategoryType.topScorers.rawValue)
        let assists = self.useCase.getStats(category: CategoryType.topAssists.rawValue)
        let redcards = self.useCase.getStats(category: CategoryType.topRedCards.rawValue)
        let yellowcards = self.useCase.getStats(category: CategoryType.topYellowCards.rawValue)

        Observable.zip(scorers, assists, redcards, yellowcards)
            .subscribeOn(scheduler)
            .subscribe(onNext: { (scorers, assists, redcards, yellowcards) in
                guard let scorer = scorers[safe: 0],
                      let assist = assists[safe: 0],
                      let redcard = redcards[safe: 0],
                      let yellowcard = yellowcards[safe: 0] else { return }
                topFour.accept([scorer, assist, redcard, yellowcard])
            })
            .disposed(by: disposeBag)

        let topscorers = input.loadTrigger
            .flatMapLatest {
                return scorers
                    .trackActivity(indicator)
                    .asDriver(onErrorJustReturn: [])
            }

        input.selectTrigger
            .withLatestFrom(topscorers) { indexPath, stats in
                return stats[indexPath.row]
            }
            .drive(onNext: { stat in
                self.navigator.toDetail(thisStat: stat)
            })
            .disposed(by: disposeBag)

        return Output(topscorers: topscorers,
                      indicator: indicator.asDriver(),
                      topFour: topFour.asDriver())
    }
}
