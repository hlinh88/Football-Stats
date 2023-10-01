//
//  News.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 1/10/2023.
//

import Foundation

struct News: Codable {
    var title: String
    var url: String
    var img: String

    enum CodingKeys: String, CodingKey {
        case title, url, img
    }
}
