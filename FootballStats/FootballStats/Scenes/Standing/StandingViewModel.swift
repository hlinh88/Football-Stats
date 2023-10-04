//
//  StandingViewModel.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 4/10/2023.
//

import Foundation
import RxRelay
import RxSwift
import RxCocoa
import RxSwiftUtilities

struct StandingViewModel {
    var useCase: StandingUseCaseType
    var navigator: StandingNavigatorType
}

extension StandingViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }

    struct Output {
        let standings: Driver<[Standing]>
        let indicator: Driver<Bool>
    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let indicator = ActivityIndicator()

        let standings = input.loadTrigger
            .flatMapLatest { _ in
                return self.useCase.getStanding()
                    .trackActivity(indicator)
                    .asDriver(onErrorJustReturn: [])
            }
        return Output(standings: standings, indicator: indicator.asDriver())
    }
}
