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

final class NewsViewModel: NSObject {
    let news = BehaviorRelay<[News]>(value: [])

    private let newsRepository = NewsRepositoryImpl()

    override init() {
        super.init()
        news.accept(self.news.value + CreateNewsData.createNewsData())
//        news.accept(self.news.value + newsRepository.requestNews())
    }
}
