//
//  StatsType.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 11/10/2023.
//

import UIKit

enum StatsType: Int {
    case goals = 0
    case assists = 1
    case red = 2
    case yellow = 3

    var title: String {
        switch self.rawValue {
        case 0:
            return "Goals"
        case 1:
            return "Assists"
        case 2:
            return "Red Cards"
        default:
            return "Yellow Cards"
        }
    }

    func getValue(thisStat: Stats) -> String {
        guard let statistic = thisStat.statistics[safe: 0] else { return Constants.emptyString }
        switch self.rawValue {
        case 0:
            return String(statistic.goals.total)
        case 1:
            return String(statistic.goals.assists ?? 0)
        case 2:
            return String(statistic.cards.red)
        default:
            return String(statistic.cards.yellow)
        }
    }

    var gradientColors: [CGColor] {
        switch self.rawValue {
        case 0:
            return [Assets.gradientBlue1.color.cgColor,
                    Assets.gradientBlue2.color.cgColor,
                    Assets.gradientBlue3.color.cgColor,
                    Assets.gradientBlue4.color.cgColor]
        case 1:
            return [Assets.gradientGreen1.color.cgColor,
                    Assets.gradientGreen2.color.cgColor,
                    Assets.gradientGreen3.color.cgColor,
                    Assets.gradientGreen4.color.cgColor]
        case 2:
            return [Assets.gradientRed1.color.cgColor,
                    Assets.gradientRed2.color.cgColor,
                    Assets.gradientRed3.color.cgColor,
                    Assets.gradientRed4.color.cgColor]
        default:
            return [Assets.gradientYellow1.color.cgColor,
                    Assets.gradientYellow2.color.cgColor,
                    Assets.gradientYellow3.color.cgColor,
                    Assets.gradientYellow4.color.cgColor]
        }
    }
}
