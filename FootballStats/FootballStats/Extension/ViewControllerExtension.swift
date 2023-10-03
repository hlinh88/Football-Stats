//
//  ViewControllerExtension.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 3/10/2023.
//

import UIKit

extension UIViewController {
    func popUpErrorAlert(message: String, completion: (() -> Void)?) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
