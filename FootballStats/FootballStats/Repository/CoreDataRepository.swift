//
//  CoreDataRepository.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 12/10/2023.
//

import Foundation
import RxSwift

protocol CoreDataRepositoryType {
    func checkFavouriteExist(id: Int) -> Observable<Bool>
    func getAllFavourites() -> Observable<[FavouritePlayer]>
    func saveFavourite(thisStat: Stats) -> Observable<Void>
    func deleteFavourite(id: Int) -> Observable<Void>
}

struct CoreDataRepository: CoreDataRepositoryType {
    func checkFavouriteExist(id: Int) -> Observable<Bool> {
        return CoreDataService.shared.checkFavouriteExist(id: id)
    }

    func getAllFavourites() -> Observable<[FavouritePlayer]> {
        return CoreDataService.shared.getAllFavourites()
    }

    func saveFavourite(thisStat: Stats) -> Observable<Void> {
        return CoreDataService.shared.saveFavourite(thisStat: thisStat)
    }

    func deleteFavourite(id: Int) -> Observable<Void> {
        return CoreDataService.shared.deleteFavourite(id: id)
    }
}
