//
//  ScheduleUseCase.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 5/10/2023.
//

import Foundation
import RxSwift

protocol ScheduleUseCaseType {
    func getSchedule() -> Observable<[Schedule]>
}

struct ScheduleUseCase: ScheduleUseCaseType {
    func getSchedule() -> Observable<[Schedule]> {
        return ScheduleRepositoryImpl().requestSchedule(input: ScheduleRequest())
    }
}
