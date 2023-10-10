//
//  ViewModelType.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 6/10/2023.
//

import Foundation
import RxSwift

public protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output
}
