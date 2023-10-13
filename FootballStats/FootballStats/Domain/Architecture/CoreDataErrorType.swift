//
//  CoreDataErrorType.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 12/10/2023.
//

import Foundation

enum CoreDataErrorType: Error {
    case getFailed
    case saveFailed
    case deleteFailed
    case checkExistFailed
}
