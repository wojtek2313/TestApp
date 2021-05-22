//
//  RepoDetailsView.swift
//  TestApp
//
//  Created by Wojciech Kulas on 22/05/2021.
//

import UIKit
import SnapKit
import RxSwift

// MARK: - Protocol

protocol RepoDetailsViewProtocol {}

// MARK: - Class

class RepoDetailsView: RepoDetailsModule.View {
    // MARK: - UI
    
    private let navigationBar: CustomNavigationBar = .init(navigationBarType: .details)
    private let avatarImageView: UIImageView = .init(cornerRadius: 60)
    private let repoTitleLabel: UILabel = .init(textColor: .white, size: 24, weight: .regular, numberOfLines: 1, textAlignment: .center)
    private let usernameLabel: UILabel = .init(textColor: .white, size: 12, weight: .bold, textAlignment: .center)
    private let descriptionLabel: UILabel = .init(textColor: .white, size: 20, weight: .light)
    
    // MARK: - Private Properties
    
    private let viewModel: RepoDetailsModule.ViewModel
    
    // MARK: - Initializers
    
    init(viewModel: RepoDetailsModule.ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        setupObservers()
        configure()
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        avatarImageView.layer.masksToBounds = true
        avatarImageView.download(imageUrl: viewModel.userModel.avatarUrl)
        repoTitleLabel.text = viewModel.userModel.repoName
        usernameLabel.text = viewModel.userModel.name
        descriptionLabel.text = viewModel.userModel.description
    }
}

// MARK: - Rx

extension RepoDetailsView {
    private func setupObservers() {
        bindBackButton()
    }
    
    private func bindBackButton() {
        navigationBar.leftNavigationButton
            .rx.tap.throttle(.seconds(1), scheduler: MainScheduler.instance)
            .bind { [weak self] in
                self?.viewModel.onBackButtonTapped?()
            }.disposed(by: viewModel.disposeBag)
    }
}

// MARK: - Layout

extension RepoDetailsView {
    private func setupView() {
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        addSubviews([navigationBar, avatarImageView, repoTitleLabel, usernameLabel, descriptionLabel])
    }
    
    private func addConstraints() {
        navigationBar.snp.makeConstraints {
            $0.top.width.equalToSuperview()
        }
        avatarImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(navigationBar.snp.bottom).offset(60)
            $0.size.equalTo(120)
        }
        repoTitleLabel.snp.makeConstraints {
            $0.top.equalTo(avatarImageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(25)
        }
        usernameLabel.snp.makeConstraints {
            $0.top.equalTo(repoTitleLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalTo(repoTitleLabel)
            $0.height.equalTo(18)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(usernameLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            $0.bottom.lessThanOrEqualTo(safeAreaLayoutGuide.snp.bottom).offset(-15)
        }
    }
}
