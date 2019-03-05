//
//  AppDelegate.swift
//  Marvel
//
//  Created by Farhad Faramarzi on 3/5/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            window.backgroundColor = UIColor.white
            let nav = UINavigationController(rootViewController: MainViewController())
            nav.navigationBar.tintColor = .white
            nav.navigationBar.barStyle = .blackOpaque
            window.rootViewController = nav
            window.makeKeyAndVisible()
        }
        return true
    }
}
