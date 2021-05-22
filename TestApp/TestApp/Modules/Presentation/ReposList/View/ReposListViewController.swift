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
        setupNavigation()
    }
    
    // MARK: - Lifetime Methods
    
    override func loadView() {
        super.loadView()
        createView(rootView)
    }
}

// MARK: - Navigation

extension ReposListViewController {
    private func setupNavigation() {
        viewModel.onCellTapped = { [weak self] model in
            self?.createRepoDetailsView(model)
        }
    }
    
    private func createRepoDetailsView(_ model: UserModel) {
        let repoDetailsViewModel = RepoDetailsViewModel(userModel: model)
        let repoDetailsView = RepoDetailsView(viewModel: repoDetailsViewModel)
        let viewController = RepoDetailsViewController(rootView: repoDetailsView, viewModel: repoDetailsViewModel)
        navigationController?.pushViewController(viewController, animated: true)
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
        
        self.viewModel.errorAppeared = { [weak self] in
            self?.showFetchingErrorAppeared()
        }
    }
    
    private func showNoInternetAlert() {
        let alert = UIAlertController(title: "Internet Connection Error", message: "Something is wrong with your Internet connection, please try to relaunch the app.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func showFetchingErrorAppeared() {
        let alert = UIAlertController(title: "Something Went Wrong!", message: "Something was wrong on time of fetching data.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
