//
//  BaseViewModel.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import RxSwift
import RxCocoa

// MARK: - Class

class BaseViewModel {
    // MARK: - Public Properties
    
    public var disposeBag = DisposeBag()
    
    // MARK: - Private Properties
    
    private(set) var isActivityIndicatorVisible = BehaviorRelay<Bool>(value: false)
    
    // MARK: - Public Methods
    
    public func showIndicator(isVisible: Bool) {
        isActivityIndicatorVisible.accept(isVisible)
    }
}
