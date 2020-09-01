//
//  AppDelegate.swift
//  BWPromptViewDemo
//
//  Created by 冉彬 on 2020/7/13.
//  Copyright © 2020 BigWhite. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init()
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = UINavigationController(rootViewController: TestVC.init())
        window?.makeKeyAndVisible()
        
        return true
    }


}

