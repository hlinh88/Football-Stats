//
//  FavouriteViewModel.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 12/10/2023.
//

import Foundation
import RxSwift
import RxCocoa
import RxSwiftUtilities

struct FavouriteViewModel {
    let useCase: FavouriteUseCaseType
    let navigator: FavouriteNavigatorType
}

extension FavouriteViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
        let deleteTrigger: Driver<Int>
        let selectTrigger: Driver<Int>
    }

    struct Output {
        let favouritePlayers: Driver<[FavouritePlayer]>
        let indicator: Driver<Bool>
        let deleteFavourite: Driver<Void>
    }

    func transform(_ input: FavouriteViewModel.Input, disposeBag: DisposeBag) -> FavouriteViewModel.Output {
        let indicator = ActivityIndicator()

        let favouritePlayers = input.loadTrigger
            .flatMapLatest {
                return self.useCase.getAllFavourites()
                    .trackActivity(indicator)
                    .asDriver(onErrorJustReturn: [])
            }

        let deleteFavourite = input.deleteTrigger
            .flatMapLatest { id in
                return self.useCase.deleteFavourite(id: id)
                    .trackActivity(indicator)
                    .asDriver(onErrorDriveWith: .empty())
            }

        input.selectTrigger
            .flatMapLatest { id in
                return self.useCase.getPlayer(id: id)
                    .trackActivity(indicator)
                    .asDriver(onErrorJustReturn: [])
            }
            .drive(onNext: { stats in
                guard let playerStat = stats[safe: 0] else { return }
                self.navigator.toDetail(thisStat: playerStat)
            })
            .disposed(by: disposeBag)

        return Output(favouritePlayers: favouritePlayers,
                      indicator: indicator.asDriver(),
                      deleteFavourite: deleteFavourite)
    }
}
