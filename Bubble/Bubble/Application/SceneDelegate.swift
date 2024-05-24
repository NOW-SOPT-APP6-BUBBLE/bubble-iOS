//
//  SceneDelegate.swift
//  Bubble
//
//  Created by 서은수 on 5/9/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = StoreDetailViewController()
//        TabBarController()
        self.window?.makeKeyAndVisible()
    }
}
