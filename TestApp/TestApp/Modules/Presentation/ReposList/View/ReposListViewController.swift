//
//  ReposListViewController.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import UIKit

class ReposListViewController: BaseViewController {
    
    // MARK: - Private Properties
    
    private let rootView: ReposListModule.View
    private var viewModel: ReposListModule.ViewModel
    
    // MARK: - Initializers
    
    init(rootView: ReposListModule.View, viewModel: ReposListModule.ViewModel) {
        self.rootView = rootView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupAlerts()
    }
    
    // MARK: - Lifetime Methods
    
    override func loadView() {
        super.loadView()
        createView(rootView)
    }
}

// MARK: - Alerts

extension ReposListViewController {
    private func setupAlerts() {
        self.viewModel.internetConnectionError = { [weak self] in
            DispatchQueue.main.async {
                self?.showNoInternetAlert()
            }
        }
    }
    
    private func showNoInternetAlert() {
        let alert = UIAlertController(title: "Internet Connection Error", message: "Something is wrong with your Internet connection, please try to relaunch the app.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
