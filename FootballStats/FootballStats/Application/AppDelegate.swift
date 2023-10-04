//
//  AppDelegate.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 30/9/2023.
//

import UIKit
import CoreData
import RxSwift
import RxCocoa

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var disposeBag = DisposeBag()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        bindViewModel()
        return true
    }

    private func bindViewModel() {
           guard let window = window else { return }
           let navigator = AppNavigator(window: window)
           let useCase = AppUseCase()
           let viewModel = AppViewModel(navigator: navigator, useCase: useCase)

           let input = AppViewModel.Input(loadTrigger: Driver.just(()))
           _ = viewModel.transform(input, disposeBag: disposeBag)
       }
}
