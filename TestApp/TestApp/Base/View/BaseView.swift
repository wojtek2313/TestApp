//
//  BaseView.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import NVActivityIndicatorView
import RxSwift
import UIKit

// MARK: - Class

class BaseView: UIView {
    // MARK: - PUBLIC PROPERTIES

    let activityIndicator: NVActivityIndicatorView = .init(frame: .zero, type: .ballScaleRipple, color: .gullGray, padding: nil)
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgorundColor()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Public Methods
    
    public func bindActivityIndicator(_ viewModel: BaseViewModel) {
        viewModel.isActivityIndicatorVisible
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] value in
                self?.showLoadingProgress(value)
            }).disposed(by: viewModel.disposeBag)
    }
    
    // MARK: - Private Methods
    
    private func setBackgorundColor() {
        backgroundColor = .ebonyClay
    }
    
    private func showLoadingProgress(_ show: Bool) {
        show ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
        isUserInteractionEnabled = !show
    }
}
