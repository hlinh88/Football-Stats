//
//  RecordsType.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 11/10/2023.
//

import Foundation

enum RecordsType: Int {
    case goals = 0
    case passes = 1
    case shots = 2
    case appearances = 3

    var title: String {
        switch self.rawValue {
        case 0:
            return "Goals"
        case 1:
            return "Passes"
        case 2:
            return "Shots"
        default:
            return "Appearances"
        }
    }
}
