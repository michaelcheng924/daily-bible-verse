//
//  AppDelegate.swift
//  Daily Bible Verse
//
//  Created by Michael Cheng on 1/2/24.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    // swiftlint: disable line_length
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                // Handle the error here.
                print("Error requesting authorization for push notifications: \(error.localizedDescription)")
            } else if granted {
                // User granted permission
                print("User granted permission for push notifications")
            } else {
                // User denied permission
                print("User denied permission for push notifications")
            }
        }
        
        return true
    }
}
