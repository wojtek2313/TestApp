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
    
    // MARK: - Private Properties
    
    private lazy var reposListViewController: ReposListViewController? = { [weak self] in
        guard let self = self else { return nil }
        let reposListViewModel = ReposListViewModel()
        let reposListView = ReposListView(viewModel: reposListViewModel)
        let reposListViewController = ReposListViewController(rootView: reposListView, viewModel: reposListViewModel)
        return reposListViewController
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        startAppFlow(atScene: scene)
    }

    // MARK: - Start App Flow
    
    private func startAppFlow(atScene scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        if let reposListViewController = reposListViewController {
            navigationController = UINavigationController(rootViewController: reposListViewController)
            navigationController?.isNavigationBarHidden = true
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    }
}

