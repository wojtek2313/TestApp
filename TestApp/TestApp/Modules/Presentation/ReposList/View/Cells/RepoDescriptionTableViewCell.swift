//
//  RepoDescriptionTableViewCell.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import UIKit

class RepoDescriptionTableViewCell: UITableViewCell {
    // MARK: - UI
    
    let cellBackgroundView: UIView = .init(cornerRadius: 25)
    let avatarImageView: UIImageView = .init(cornerRadius: 22)
    let repoTitleLabel: UILabel = .init(textColor: .white, size: 24, weight: .regular, numberOfLines: 1)
    let usernameLabel: UILabel = .init(textColor: .white, size: 12, weight: .bold)
    
    // MARK: - Private Properties
    
    private var constraintsAreSet: Bool = false
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods

    public func configure(withModel model: UserModel) {
        self.cellBackgroundView.backgroundColor = model.cellType.backgroundColor
        avatarImageView.layer.masksToBounds = true
        avatarImageView.download(imageUrl: model.avatarUrl)
        repoTitleLabel.text = model.repoName
        usernameLabel.text = model.name
    }
}

// MARK: - Layout

extension RepoDescriptionTableViewCell {
    private func setupView() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubviews([avatarImageView, repoTitleLabel, usernameLabel])
    }
    
    private func addConstraints() {
        if !constraintsAreSet {
            cellBackgroundView.snp.makeConstraints {
                $0.leading.top.equalToSuperview().offset(20)
                $0.trailing.bottom.equalToSuperview().offset(-20)
                $0.height.equalTo(120)
            }
            avatarImageView.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalToSuperview().offset(10)
                $0.size.equalTo(45)
            }
            repoTitleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(30)
                $0.leading.equalTo(avatarImageView.snp.trailing).offset(25)
                $0.trailing.equalToSuperview().offset(-20)
            }
            usernameLabel.snp.makeConstraints {
                $0.top.equalTo(repoTitleLabel.snp.bottom).offset(5)
                $0.leading.trailing.equalTo(repoTitleLabel)
            }
            constraintsAreSet = true
        }
        super.updateConstraints()
    }
}
