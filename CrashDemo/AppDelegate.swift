//
//  AppDelegate.swift
//
//  Created by Utkarsh Raj on 10/03/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let rootNav = UINavigationController(rootViewController: ViewController())
        window!.rootViewController = rootNav
        window!.makeKeyAndVisible()
        window!.backgroundColor = .white
        return true
    }
}

