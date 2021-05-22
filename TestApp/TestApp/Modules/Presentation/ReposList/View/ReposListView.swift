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
    
    private let tableView: UITableView = .init(tableViewCells: [RepoDescriptionTableViewCell.self])
    
    // MARK: - Private Properties
    
    private let viewModel: ReposListModule.ViewModel
    
    // MARK: - Initializers
    
    init(viewModel: ReposListModule.ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        setupObservers()
    }
}

// MARK: - Rx

extension ReposListView {
    private func setupObservers() {
        bindUserModels()
    }
    
    private func bindUserModels() {
        viewModel.userModels.bind(to: tableView.rx.items(cellIdentifier: String(describing: RepoDescriptionTableViewCell.self), cellType: RepoDescriptionTableViewCell.self)) { index, model, cell in
            cell.configure(withModel: model)
        }.disposed(by: viewModel.disposeBag)
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
