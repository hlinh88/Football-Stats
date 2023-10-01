//
//  AppDelegate.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 30/9/2023.
//

import UIKit
import CoreData

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarController.instantiateFromNib()
        window?.makeKeyAndVisible()
        getAPIKeys()
        return true
    }

    private func getAPIKeys() {
        var keys: NSDictionary?
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        let APIKey = keys?["API_KEY"] as? String
        let APINewsHost = keys?["API_NEWS_HOST"] as? String
        let APIFootballHost = keys?["API_FOOTBALL_HOST"] as? String
        if let APIKey, let APINewsHost, let APIFootballHost {
            Constants.APIKey = APIKey
            Constants.APINewsHost = APINewsHost
            Constants.APIFootballHost = APIFootballHost
        }
    }
}
