//
//  NewsNavigator.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 6/10/2023.
//

import UIKit
import SafariServices

protocol NewsNavigatorType {
    func pushToSafari(urlString: String)
}

struct NewsNavigator: NewsNavigatorType {
    unowned let navigationController: UINavigationController

    func pushToSafari(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let viewController = SFSafariViewController(url: url)
        viewController.hidesBottomBarWhenPushed = true
        navigationController.present(viewController, animated: true, completion: nil)
    }
}
