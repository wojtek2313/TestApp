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
    // MARK: - UI
    
    private let tableView: UITableView = .init(tableViewCells: [])
    
    // MARK: - Private Properties
    
    private let viewModel: ReposListModule.ViewModel
    
    // MARK: - Initializers
    
    init(viewModel: ReposListModule.ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
    }
}

// MARK: - Layout

extension ReposListView {
    private func setupView() {
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        addSubviews([tableView])
    }
    
    private func addConstraints() {
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
