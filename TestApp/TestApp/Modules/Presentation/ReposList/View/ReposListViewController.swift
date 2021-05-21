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
    private let viewModel: ReposListModule.ViewModel
    
    // MARK: - Initializers
    
    init(rootView: ReposListModule.View, viewModel: ReposListModule.ViewModel) {
        self.rootView = rootView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Lifetime Methods
    
    override func loadView() {
        super.loadView()
        createView(rootView)
    }
}
