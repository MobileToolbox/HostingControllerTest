//
//  SceneDelegate.swift
//  HostingControllerTest
//
//  Created by keith Alperin on 12/17/21.
//

import UIKit

/// As a `Presenter`, the scene delegate can present a full screen UIViewController
class SceneDelegate: UIResponder, UIWindowSceneDelegate, Presenter {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        
        //This is most of the magic here that we pass a `Presenter` to the SwiftUI hierarchy which it can use to present a full screen view controller in such a way that `preferredScreenEdgesDeferringSystemGestures` will still work
        var contentView = ContentView(presenter: self)
        
        //`HostingController` is a `UIHostingController` and it conforms to `Presenter` and therefor can present a full screen view controller.
        //If THIS is the view controller that does the presenting then it is in the hiearchy of our root view controller and therefor can honor `preferredScreenEdgesDeferringSystemGestures`
        //when we use a `UIViewControllerRepresentable` to present a full screen view controller, it provides it's *own* `UIHostingController` which implements its own `preferredScreenEdgesDeferringSystemGestures`
        let hostingController = HostingController(rootView: contentView)
        contentView.presenter = hostingController
        
        window.rootViewController = hostingController // Your initial view controller.
        
        window.makeKeyAndVisible()
        self.window = window
    }

    func presentViewController() {
        (window?.rootViewController as? Presenter)?.presentViewController()
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
    }


}

