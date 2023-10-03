//
//  TabBarController.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 1/10/2023.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let newsVC = UINavigationController(rootViewController: NewsViewController())
        let standingVC = UINavigationController(rootViewController: StandingViewController())
        let statsVC = UINavigationController(rootViewController: StatsViewController())
        let favouriteVC = UINavigationController(rootViewController: FavouriteViewController())
        let scheduleVC = UINavigationController(rootViewController: ScheduleViewController())

        let controllers = [newsVC, standingVC, scheduleVC, statsVC, favouriteVC]

        self.setViewControllers(controllers, animated: false)

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
        self.tabBar.tintColor = UIColor.mainColor
    }

    class func instantiateFromNib() -> TabBarController {
        let nib = UINib(nibName: "TabBarController", bundle: nil)
        if let tabBarVC = nib.instantiate(withOwner: nil, options: nil).first as? TabBarController {
            return tabBarVC
        }
        return TabBarController()
    }
}
