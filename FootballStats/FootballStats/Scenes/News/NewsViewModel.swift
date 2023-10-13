//
//  NewsViewModel.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 2/10/2023.
//

import UIKit
import Alamofire
import RxSwift
import RxRelay
import RxCocoa
import RxSwiftUtilities

struct NewsViewModel {
    var useCase: NewsUseCaseType
    let navigator: NewsNavigatorType
}

extension NewsViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
        let selectTrigger: Driver<IndexPath>
    }

    struct Output {
        let news: Driver<[News]>
        let indicator: Driver<Bool>
    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let indicator = ActivityIndicator()

        let news = input.loadTrigger
            .flatMapLatest { _ in
                return self.useCase.getNews()
                    .trackActivity(indicator)
                    .asDriver(onErrorJustReturn: [])
            }

        input.selectTrigger
            .withLatestFrom(news) { indexPath, new in
                return new[indexPath.row]
            }
            .drive(onNext: { new in
                self.navigator.pushToSafari(urlString: new.url)
            })
            .disposed(by: disposeBag)

        return Output(news: news, indicator: indicator.asDriver())
    }
}
