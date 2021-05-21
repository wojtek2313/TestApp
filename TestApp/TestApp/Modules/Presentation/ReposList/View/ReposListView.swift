//
//  ReposListView.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import UIKit
import SnapKit

// MARK: - Protocol

protocol ReposListViewProtocol {}

// MARK: - Class

class ReposListView: ReposListModule.View {
    // MARK: - Private Properties
    
    private let viewModel: ReposListModule.ViewModel
    
    // MARK: - Initializers
    
    init(viewModel: ReposListModule.ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }
    
    
}
