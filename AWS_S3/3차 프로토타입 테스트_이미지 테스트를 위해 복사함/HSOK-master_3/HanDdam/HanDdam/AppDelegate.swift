//
//  AppDelegate.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/15.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit
import AWSS3

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let beLogged = UserDefaults.standard.bool(forKey: "login_state")
        if beLogged == true {
            loggedIn = true
        }
        
        self.initializeS3()
        
        return true
    }
    
    func initializeS3() {
        let poolId = "ap-northeast-2:16feb43a-2756-4878-908d-c934745d5210"
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .APNortheast2, identityPoolId: poolId)
        let configuration = AWSServiceConfiguration(region: .APNortheast2, credentialsProvider: credentialProvider)
        AWSServiceManager.default()?.defaultServiceConfiguration = configuration
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

