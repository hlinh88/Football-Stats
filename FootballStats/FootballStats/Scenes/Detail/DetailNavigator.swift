//
//  DetailNavigator.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 10/10/2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol DetailNavigatorType {
    func backToScreen()
}

struct DetailNavigator: DetailNavigatorType {
    unowned let navigationController: UINavigationController

    func backToScreen() {
        navigationController.popViewController(animated: true)
    }
}
