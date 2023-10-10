//
//  DictionaryExtension.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 4/10/2023.
//

import Foundation

extension Dictionary {
    mutating func merge(dict: [Key: Value]) {
        for (key, value) in dict {
            updateValue(value, forKey: key)
        }
    }
}
