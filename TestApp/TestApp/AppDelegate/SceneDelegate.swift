//
//  SceneDelegate.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        startAppFlow(atScene: scene)
    }

    // MARK: - Start App Flow
    
    private func startAppFlow(atScene scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        navigationController = UINavigationController(rootViewController: ReposListViewController())
        navigationController?.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

