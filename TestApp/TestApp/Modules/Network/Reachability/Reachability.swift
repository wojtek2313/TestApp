//
//  Reachability.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import Foundation
import Alamofire
import RxCocoa

class Reachability {
    public var isReachable = BehaviorRelay<Bool?>(value: nil)
    
    init() {
        bindInternetReachability()
    }
    
    // MARK: - Private Properties
    
    private let networkReachabilityMenager = NetworkReachabilityManager()
    
    // MARK: - Private Properties
    
    private func bindInternetReachability() {
        networkReachabilityMenager?.startListening(onUpdatePerforming: { [weak self] internetStatus in
            guard let self = self else { return }
            switch internetStatus {
            case .notReachable:
                self.isReachable.accept(false)
            case .unknown:
                self.isReachable.accept(false)
            case .reachable(_):
                self.isReachable.accept(true)
            }
        })
    }
}
