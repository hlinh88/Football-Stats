//
//  FavouriteUseCase.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 12/10/2023.
//

import Foundation
import RxSwift
import RxCocoa

protocol FavouriteUseCaseType {
    func getAllFavourites() -> Observable<[FavouritePlayer]>
    func deleteFavourite(id: Int) -> Observable<Void>
    func getPlayer(id: Int) -> Observable<[Stats]>
}

struct FavouriteUseCase: FavouriteUseCaseType {
    func getAllFavourites() -> Observable<[FavouritePlayer]> {
        return CoreDataRepository().getAllFavourites()
    }

    func deleteFavourite(id: Int) -> Observable<Void> {
        return CoreDataRepository().deleteFavourite(id: id)
    }

    func getPlayer(id: Int) -> Observable<[Stats]> {
        return PlayerRepositoryImpl().requestPlayer(input: PlayerRequest(id: id))
    }
}
