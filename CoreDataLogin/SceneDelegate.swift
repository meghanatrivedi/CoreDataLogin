//
//  SceneDelegate.swift
//  CoreDataLogin
//
//  Created by Meghna on 17/05/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    var user = [User]()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        user = DatabaseHelper.shareInstance.getUserData()
        let keyexists = user.count
        for i in 0..<(keyexists) {
            print(i)
            let val = user[i].islogin
            print(val)
            if val == "true"{
                print("Login")
                let initialViewController = storyboard.instantiateViewController(withIdentifier: "HomeVC")
                self.window?.rootViewController = initialViewController
                self.window?.makeKeyAndVisible()
                break;
            }else {
                print("Not login")
                let initialViewController = storyboard.instantiateViewController(withIdentifier: "RegistationVC")
                self.window?.rootViewController = initialViewController
                self.window?.makeKeyAndVisible()
            }
            
        }
//        let islogin = UserDefaults.standard.object(forKey: "emailid")
//        if (islogin != nil) {
//            print("Login")
//
//           // self.window = UIWindow(frame: UIScreen.main.bounds)
//               let initialViewController = storyboard.instantiateViewController(withIdentifier: "HomeVC")
//               self.window?.rootViewController = initialViewController
//               self.window?.makeKeyAndVisible()
//        }else{
//            print("not login")
//            //self.window = UIWindow(frame: UIScreen.main.bounds)
//               let initialViewController = storyboard.instantiateViewController(withIdentifier: "RegistationVC")
//               self.window?.rootViewController = initialViewController
//               self.window?.makeKeyAndVisible()
//        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

