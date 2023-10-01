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

        let controllers = [newsVC, standingVC, statsVC, favouriteVC]

        self.setViewControllers(controllers, animated: false)

        configTabBar()
    }

    private func configTabBar() {
        guard let items = self.tabBar.items else { return }

        let images = ["newspaper", "123.rectangle", "chart.bar.xaxis", "heart.circle"]
        let selectedImages = ["newspaper.fill", "123.rectangle.fill", "chart.bar.xaxis", "heart.circle.fill"]
        let titles = ["News", "Standing", "Stats", "Favourite"]

        for index in 0...(items.count-1) {
            items[index].image = UIImage(systemName: images[index])
            items[index].selectedImage = UIImage(systemName: selectedImages[index])
            items[index].title = titles[index]
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
