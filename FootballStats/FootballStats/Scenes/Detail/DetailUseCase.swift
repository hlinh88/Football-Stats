//
//  DetailUseCase.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 10/10/2023.
//

import Foundation
import RxSwift
import RxCocoa

protocol DetailUseCaseType {
    func saveFavourite(thisStat: Stats) -> Observable<Void>
    func checkFavouriteExist(id: Int) -> Observable<Bool>
    func deleteFavourite(id: Int) -> Observable<Void>
}

struct DetailUseCase: DetailUseCaseType {
    func saveFavourite(thisStat: Stats) -> Observable<Void> {
        return CoreDataRepository().saveFavourite(thisStat: thisStat)
    }

    func checkFavouriteExist(id: Int) -> Observable<Bool> {
        return CoreDataRepository().checkFavouriteExist(id: id)
    }

    func deleteFavourite(id: Int) -> Observable<Void> {
        return CoreDataRepository().deleteFavourite(id: id)
    }

}
