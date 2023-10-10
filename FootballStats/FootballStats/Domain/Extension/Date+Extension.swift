//
//  DateExtension.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 5/10/2023.
//

import Foundation

extension Date {
    func getCurrentDate() -> Date {
        let currentWeekDate = NSCalendar.current.date(byAdding: .weekOfYear, value: -1, to: NSDate() as Date)
        guard let currentWeekDate else { return Date() }
        return currentWeekDate
    }

    func getLastWeekDate() -> Date {
        let lastWeekDate = NSCalendar.current.date(byAdding: .weekOfYear, value: -2, to: NSDate() as Date)
        guard let lastWeekDate else { return Date() }
        return lastWeekDate
    }
}
