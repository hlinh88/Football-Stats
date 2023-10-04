//
//  AppViewModel.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 8/10/2023.
//

import Foundation
import RxSwift
import RxCocoa

struct AppViewModel {
    let navigator: AppNavigatorType
    let useCase: AppUseCaseType
}

extension AppViewModel: ViewModelType {

    struct Input {
        let loadTrigger: Driver<Void>
    }

    struct Output {

    }

    func transform(_ input: AppViewModel.Input, disposeBag: DisposeBag) -> AppViewModel.Output {

        input.loadTrigger
            .flatMapLatest {
                return self.useCase.getAPIKeys()
                    .asDriver(onErrorJustReturn: ())
            }
            .drive(onNext: { _ in
                self.navigator.toTabBar()
            })
            .disposed(by: disposeBag)

        return Output()
    }
}
