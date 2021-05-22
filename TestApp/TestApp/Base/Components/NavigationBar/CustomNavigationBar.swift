//
//  CustomNavigationBar.swift
//  AppZumiTest
//
//  Created by Wojciech Kulas on 20/05/2021.
//

import UIKit
import RxSwift

class CustomNavigationBar: UIView {
    // MARK: - UI
    
    private let navigationBarType: CustomNavigationBarType
    private let titleLabel: UILabel = .init(textColor: .white, size: 24, weight: .bold, textAlignment: .center)
    
    public let leftNavigationButton: UIButton = .init(type: .custom)
    
    // MARK: - Public Properties
    
    public var disposeBag = DisposeBag()
    
    // MARK: - Initializers
    
    init(navigationBarType: CustomNavigationBarType) {
        self.navigationBarType = navigationBarType
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        backgroundColor = .gullGray
        leftNavigationButton.setImage(navigationBarType.leftButtonIcon)
        leftNavigationButton.tintColor = .white
        titleLabel.text = navigationBarType.title
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        addSubviews([leftNavigationButton, titleLabel])
    }
    
    private func addConstraints() {
        leftNavigationButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.size.equalTo(44)
            $0.leading.equalToSuperview().offset(15)
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            $0.height.equalTo(25)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
}
