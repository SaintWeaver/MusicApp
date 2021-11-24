//
//  AppDelegate.swift
//  MusicApp
//
//  Created by Maksom Kolbas on 15.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = SignUpViewController()
        let navigationVC = UINavigationController.init(rootViewController: vc)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        return true
    }
}

