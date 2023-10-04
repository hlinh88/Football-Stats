//
//  StandingUseCase.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 5/10/2023.
//

import Foundation
import RxSwift

protocol StandingUseCaseType {
    func getStanding() -> Observable<[Standing]>
}

struct StandingUseCase: StandingUseCaseType {
    func getStanding() -> Observable<[Standing]> {
        return StandingRepositoryImpl().requestStanding(input: StandingRequest())
    }
}
