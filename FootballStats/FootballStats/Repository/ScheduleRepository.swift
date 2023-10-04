//
//  ScheduleRepository.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 4/10/2023.
//

import Foundation
import Alamofire
import RxSwift

protocol ScheduleRepository {
    func requestSchedule(input: ScheduleRequest) -> Observable<[Schedule]>
}

final class ScheduleRepositoryImpl: ScheduleRepository {
    func requestSchedule(input: ScheduleRequest) -> Observable<[Schedule]> {
        return APIService.shared.request(input: input)
        .map { (result: SchedulesResponse) in
            return result.response
        }
        .catchErrorJustReturn([])
    }
}
