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
    }
    
    private func addConstraints() {
        if !constraintsAreSet {
        }
        super.updateConstraints()
    }
}
