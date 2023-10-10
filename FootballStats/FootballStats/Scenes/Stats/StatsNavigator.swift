//
//  StatsNavigator.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 9/10/2023.
//

import UIKit
import RxSwift
import RxCocoa

protocol StatsNavigatorType {
    func toDetail(thisStat: Stats)
}

struct StatsNavigator: StatsNavigatorType {
    unowned let navigationController: UINavigationController

    func toDetail(thisStat: Stats) {
        let viewController = DetailViewController()
        let useCase = DetailUseCase()
        let navigator = DetailNavigator(navigationController: navigationController)
        let viewModel = DetailViewModel(navigator: navigator,
                                        useCase: useCase,
                                        thisStat: thisStat)
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
