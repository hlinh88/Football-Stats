//
//  ScheduleViewModel.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 4/10/2023.
//

import Foundation
import RxRelay
import RxSwift
import RxCocoa
import RxSwiftUtilities

struct ScheduleViewModel {
    var useCase: ScheduleUseCase
    var navigator: ScheduleNavigatorType
}

extension ScheduleViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }

    struct Output {
        let schedules: Driver<[Schedule]>
        let indicator: Driver<Bool>
    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let indicator = ActivityIndicator()

        let schedules = input.loadTrigger
            .flatMapLatest { _ in
                return self.useCase.getSchedule()
                    .trackActivity(indicator)
                    .asDriver(onErrorJustReturn: [])
            }

        return Output(schedules: schedules, indicator: indicator.asDriver())
    }
}
