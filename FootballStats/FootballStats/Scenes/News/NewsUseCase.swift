//
//  NewsUseCase.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 5/10/2023.
//
import Foundation
import RxSwift

protocol NewsUseCaseType {
    func getNews() -> Observable<[News]>
}

struct NewsUseCase: NewsUseCaseType {
    func getNews() -> Observable<[News]> {
        return NewsRepositoryImpl().requestNews(input: NewsRequest())
    }
}
