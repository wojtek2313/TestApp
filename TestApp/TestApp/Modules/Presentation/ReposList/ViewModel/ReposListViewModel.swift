//
//  ReposListViewModel.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import RxSwift
import RxCocoa

// MARK: - Protocol

protocol ReposListViewModelProtocol {
    var internetConnectionError: (() -> Void)? { get set }
}

// MARK: - Class

class ReposListViewModel: ReposListModule.ViewModel {
    // MARK: - Navigation CallBacks
    
    public var internetConnectionError: (() -> Void)?
    
    // MARK: - Private Properties
    
    private var reachability: Reachability
    private var isNetworkReachable: BehaviorRelay<Bool?> { reachability.isReachable }
    
    // MARK: - Initializers
    
    init(reachability: Reachability) {
        self.reachability = reachability
        super.init()
        bindInternetReachability()
    }
    
    // MARK: - Private Methods
    
    private func bindInternetReachability() {
        isNetworkReachable
            .skip(1)
            .subscribe(onNext: { [weak self] isReachable in
                guard let isReachable = isReachable else {
                    self?.internetConnectionError?()
                    return
                }
                if !isReachable {
                    self?.internetConnectionError?()
                }
            }).disposed(by: disposeBag)
    }
    
}
