//
//  RepoDetailsViewController.swift
//  TestApp
//
//  Created by Wojciech Kulas on 22/05/2021.
//

import UIKit

class RepoDetailsViewController: BaseViewController {
    // MARK: - Private Properties
    
    private let rootView: RepoDetailsModule.View
    private var viewModel: RepoDetailsModule.ViewModel
    
    // MARK: - Initializers
    
    init(rootView: RepoDetailsModule.View, viewModel: RepoDetailsModule.ViewModel) {
        self.rootView = rootView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupNavigation()
    }
    
    // MARK: - Lifetime Methods

    override func loadView() {
        super.loadView()
        createView(rootView)
    }
}

// MARK: - Navigation

extension RepoDetailsViewController {
    private func setupNavigation() {
        viewModel.onBackButtonTapped = { [weak self] in
            self?.popViewContoroller()
        }
    }
    
    private func popViewContoroller() {
        navigationController?.popViewController(animated: true)
    }
}
