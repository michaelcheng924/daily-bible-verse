//
//  AppDelegate.swift
//  Daily Bible Verse
//
//  Created by Michael Cheng on 1/2/24.
//

import Foundation
import UIKit
import AVFoundation

class AppDelegate: NSObject, UIApplicationDelegate {
    var backgroundMusicPlayer: AVAudioPlayer?
    
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

        // Set up and play background music
        setupBackgroundMusic()
        
        return true
    }
    
    func setupBackgroundMusic() {
        print(Bundle.main.url(forResource: "music-pathfinder", withExtension: "mp3"))
        
        if let musicURL = Bundle.main.url(forResource: "music-pathfinder", withExtension: "mp3") {
            do {
                print("HIHI")
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: musicURL)
                backgroundMusicPlayer?.numberOfLoops = -1 // To loop indefinitely
                backgroundMusicPlayer?.volume = 0.5 // Adjust the volume as needed
                backgroundMusicPlayer?.prepareToPlay()
                backgroundMusicPlayer?.play()
                
                print("YOYO")
            } catch {
                print("Error loading and playing background music: \(error.localizedDescription)")
            }
        }
    }
}
