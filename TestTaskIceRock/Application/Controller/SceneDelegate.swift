//
//  SceneDelegate.swift
//  TestTaskIceRock
//
//  Created by Лаборатория on 19.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: winScene)
        window.rootViewController = AuthViewController()
        window.makeKeyAndVisible()
        self.window = window
    }

}

