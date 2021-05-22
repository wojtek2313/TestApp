//
//  ReposListView.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import UIKit
import SnapKit
import RxSwift

// MARK: - Protocol

protocol ReposListViewProtocol {}

// MARK: - Class

class ReposListView: ReposListModule.View {
    // MARK: - UI
    
    private let navigationBar: CustomNavigationBar = .init(navigationBarType: .repositories)
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
        bindActivityIndicator(viewModel)
        bindUserModels()
        bindSortButton()
    }
    
    private func bindUserModels() {
        viewModel.userModels.bind(to: tableView.rx.items(cellIdentifier: String(describing: RepoDescriptionTableViewCell.self), cellType: RepoDescriptionTableViewCell.self)) { index, model, cell in
            cell.configure(withModel: model)
        }.disposed(by: viewModel.disposeBag)
    }
    
    private func bindSortButton() {
        navigationBar
            .leftNavigationButton
            .rx.tap
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .bind { [weak self] in
                guard let self = self else { return }
                let isSorted = !self.viewModel.areReposSorted.value
                self.viewModel.areReposSorted.accept(isSorted)
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
        addSubviews([navigationBar, tableView, activityIndicator])
    }
    
    private func addConstraints() {
        navigationBar.snp.makeConstraints {
            $0.top.width.equalToSuperview()
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        activityIndicator.snp.makeConstraints {
            $0.size.equalTo(45)
            $0.center.equalToSuperview()
        }
    }
}
