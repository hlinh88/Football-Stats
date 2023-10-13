//
//  CoreDataService.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 12/10/2023.
//

import CoreData
import RxSwift

final class CoreDataService {
    let request = Favourite.fetchRequest()

    static let shared = CoreDataService()

    private init() {}

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FootballStats")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Load Core Data failed: \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func checkFavouriteExist(id: Int) -> Observable<Bool> {
        let context = persistentContainer.viewContext

        return Observable.create { observer in
            do {
                let favouriteEntity = try context.fetch(self.request)
                observer.onNext(favouriteEntity.contains(where: { $0.id == id }))
                observer.onCompleted()
            } catch {
                observer.onError(CoreDataErrorType.checkExistFailed)
            }
            return Disposables.create()
        }
    }

    func getAllFavourites() -> Observable<[FavouritePlayer]> {
        let context = persistentContainer.viewContext
        return Observable.create { observer in
            do {
                let favouriteEntity = try context.fetch(self.request)
                let favourite = favouriteEntity.map { fav -> FavouritePlayer in
                    return FavouritePlayer(id: Int(fav.id),
                                           playerName: fav.playerName ?? Constants.emptyString,
                                           playerImage: fav.playerImage ?? Constants.emptyString,
                                           clubName: fav.clubName ?? Constants.emptyString,
                                           clubLogo: fav.clubLogo ?? Constants.emptyString)
                }
                observer.onNext(favourite)
                observer.onCompleted()
            } catch {
                observer.onError(CoreDataErrorType.getFailed)
            }
            return Disposables.create()
        }
    }

    func saveFavourite(thisStat: Stats) -> Observable<Void> {
        let context = persistentContainer.viewContext
        return Observable.create { observer in
            do {
                Favourite(context: context).do {
                    guard let statistic = thisStat.statistics[safe: 0] else { return }
                    $0.id = Int64(thisStat.player.id)
                    $0.playerName = thisStat.player.name
                    $0.playerImage = thisStat.player.photo
                    $0.clubName = statistic.team.name
                    $0.clubLogo = statistic.team.logo
                }
                try context.save()
                observer.onNext(())
                observer.onCompleted()
            } catch {
                observer.onError(CoreDataErrorType.saveFailed)
            }
            return Disposables.create()
        }
    }

    func deleteFavourite(id: Int) -> Observable<Void> {
        let context = persistentContainer.viewContext

        return Observable.create { observer in
            do {
                if let favourites = try? context.fetch(self.request) {
                    for favourite in favourites where favourite.id == id {
                        context.delete(favourite)
                        try context.save()
                        observer.onNext(())
                        observer.onCompleted()
                    }
                }
            } catch {
                observer.onError(CoreDataErrorType.deleteFailed)
            }
            return Disposables.create()
        }
    }

}
