//
//  NewsRepository.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 3/10/2023.
//

import Foundation
import Alamofire
import RxSwift

protocol NewsRepository {
    func requestNews(input: NewsRequest) -> Observable<[News]>
}

final class NewsRepositoryImpl: NewsRepository {
    func requestNews(input: NewsRequest) -> Observable<[News]> {
        return APIService.shared.request(input: input)
        .map { (response: [News]) in
            return response
        }
        .catchErrorJustReturn([])
    }
}
