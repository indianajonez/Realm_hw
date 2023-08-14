//
//  SceneDelegate.swift
//  Realm_hw
//
//  Created by Ekaterina Saveleva on 12.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        
        let tabBarController = TabBarController()
        let window = UIWindow(windowScene: scene)
        window.rootViewController = tabBarController
        
        self.window = window
        window.makeKeyAndVisible()
    }
}

