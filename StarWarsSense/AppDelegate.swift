//
//  AppDelegate.swift
//  CARVTest
//
//  Created by Olivier Conan on 03/10/2020.
//  Copyright © 2020 OlivierConan. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: HomeCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // MARK: - Initiate Home
        let navController = NavigationController()
        navController.setNavigationBarHidden(true, animated: false)
        coordinator = HomeCoordinator(navigationController: navController)
        coordinator?.start()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }

}
