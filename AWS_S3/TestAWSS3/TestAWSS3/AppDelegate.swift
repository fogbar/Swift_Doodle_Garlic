//
//  AppDelegate.swift
//  TestAWSS3
//
//  Created by garlic on 2020/07/20.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit
import AWSS3

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //self.startInternetMonitoring()
        self.initializeS3()
        
        return true
    }
    //poolId가 뭔지 잘 모르겠지만, 이걸 가지고 S3를 초기화시킴.
    func initializeS3() {
        let poolId = "ap-northeast-2:16feb43a-2756-4878-908d-c934745d5210"
        
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .APNortheast2, identityPoolId: poolId)
        
        let configuration = AWSServiceConfiguration(region: .APNortheast2, credentialsProvider: credentialProvider)
        
        AWSServiceManager.default()?.defaultServiceConfiguration = configuration
    }
    //이건 굳이 필요 없음.
//    func startInternetMonitoring() {
//
//        if #available(iOS 12.0, *) {
//            if !InternetConnectoinMonitor.shared.isMonitoring {
//                InternetConnectoinMonitor.shared.startMonitoring()
//            } else {
//                InternetConnectoinMonitor.shared.stopMonitoring()
//            } 
//        }
//    }

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

