//
//  AppDelegate.swift
//  dwarfJourney
//
//  Created by Ehley, David A (ehley001) on 3/13/18.
//  Copyright © 2018 Ehley, David A (ehley001). All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var playerStats = stats(1,3,4)
    var restart = false
    var story = Node(nil,Story("","","",false),nil)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        if(playerStats.strength != 1)
        {
            let success = playerStats.saveChanges()
            if(success){
                print("Saved Stats")
            }else{
                print("Could not save Stats")
            }
        }
       
        if(story.value.story !=  ""){
            let success2 = story.saveChanges()
            if(success2)
            {
                print("Saved Story")
            }
            else{
                print("Could not save Story")
            }
        }
        
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let exampleViewController: storyScreen = mainStoryBoard.instantiateViewController(withIdentifier: "LoadScreen") as! storyScreen
        self.window?.rootViewController = exampleViewController
        self.window?.makeKeyAndVisible()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    static func shared() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }

}

