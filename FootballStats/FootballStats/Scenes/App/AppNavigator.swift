//
//  AppNavigator.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 8/10/2023.
//

import Foundation
import RxSwift
import RxCocoa
import Reusable

protocol AppNavigatorType {
    func toTabBar()
}

struct AppNavigator: AppNavigatorType {
    unowned let window: UIWindow

    func toTabBar() {
        let tabBarVC = TabBarController.loadFromNib()
        initSubView(tabBarVC: tabBarVC)
        window.rootViewController = tabBarVC
        window.makeKeyAndVisible()
    }

    private func initSubView(tabBarVC: TabBarController) {
        let newsVC = setUpNewsController()
        let standingVC = setUpStandingController()
        let scheduleVC = setUpScheduleController()
        let statsVC = setUpStatsController()
        let favouriteVC = setUpFavouriteController()

        let controllers = [newsVC, standingVC, scheduleVC, statsVC, favouriteVC]

        tabBarVC.setViewControllers(controllers, animated: false)
    }

    private func setUpNewsController() -> UINavigationController {
        let viewController = NewsViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let navigator = NewsNavigator(navigationController: navigationController)
        let useCase = NewsUseCase()
        let viewModel = NewsViewModel(useCase: useCase, navigator: navigator)
        viewController.bindViewModel(to: viewModel)
        return navigationController
    }

    private func setUpStandingController() -> UINavigationController {
        let viewController = StandingViewController()
        let navigator = StandingNavigator()
        let useCase = StandingUseCase()
        let viewModel = StandingViewModel(useCase: useCase, navigator: navigator)
        viewController.bindViewModel(to: viewModel)
        return UINavigationController(rootViewController: viewController)
    }

    private func setUpScheduleController() -> UINavigationController {
        let viewController = ScheduleViewController()
        let navigator = ScheduleNavigator()
        let useCase = ScheduleUseCase()
        let viewModel = ScheduleViewModel(useCase: useCase, navigator: navigator)
        viewController.bindViewModel(to: viewModel)
        return UINavigationController(rootViewController: viewController)
    }

    private func setUpStatsController() -> UINavigationController {
        let viewController = StatsViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let navigator = StatsNavigator(navigationController: navigationController)
        let useCase = StatsUseCase()
        let viewModel = StatsViewModel(useCase: useCase, navigator: navigator)
        viewController.bindViewModel(to: viewModel)
        return navigationController
    }

    private func setUpFavouriteController() -> UINavigationController {
        let viewController = FavouriteViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let navigator = FavouriteNavigator(navigationController: navigationController)
        let useCase = FavouriteUseCase()
        let viewModel = FavouriteViewModel(useCase: useCase, navigator: navigator)
        viewController.bindViewModel(to: viewModel)
        return navigationController
    }
}
