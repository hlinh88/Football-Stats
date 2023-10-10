//
//  ViewControllerExtension.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 3/10/2023.
//

import UIKit
import MBProgressHUD
import RxSwift
import RxCocoa

extension UIViewController {
    func popUpErrorAlert(message: String, completion: (() -> Void)?) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension Reactive where Base: UIViewController {
    var isLoading: Binder<Bool> {
        return Binder(base) { viewController, isLoading in
            if isLoading {
                let hud = MBProgressHUD.showAdded(to: viewController.view, animated: true)
                hud.offset.y = -30
            } else {
                MBProgressHUD.hide(for: viewController.view, animated: true)
            }
        }
    }
}
