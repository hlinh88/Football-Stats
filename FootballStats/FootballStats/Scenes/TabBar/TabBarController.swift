//
//  TabBarController.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 1/10/2023.
//

import UIKit
import Reusable

final class TabBarController: UITabBarController, NibLoadable {
    override func viewDidLoad() {
        super.viewDidLoad() 
        configTabBar()
    }

    private func configTabBar() {
        guard let items = self.tabBar.items else { return }

        let tabBarInfo = TabBarInfo()

        for index in 0...(items.count-1) {
            items[index].image = UIImage(systemName: tabBarInfo.images[index])
            items[index].selectedImage = UIImage(systemName: tabBarInfo.selectedImages[index])
            items[index].title = tabBarInfo.titles[index]
        }

        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.tintColor = Assets.mainColor.color
    }
}
