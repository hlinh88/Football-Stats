//
//  Array+Extension.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 11/10/2023.
//

import Foundation

extension Array {
    public var isNotEmpty: Bool {
        return !self.isEmpty
    }

    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
