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
    var userModels: BehaviorRelay<[UserModel]> { get set }
}

// MARK: - Class

class ReposListViewModel: ReposListModule.ViewModel {
    // MARK: - Navigation CallBacks
    
    public var internetConnectionError: (() -> Void)?
    public var errorAppeared: (() -> Void)?
    
    // MARK: - Public Properties
    
    public var userModels = BehaviorRelay<[UserModel]>(value: [])
    
    // MARK: - Private Properties
    
    private var reachability: Reachability
    private var isNetworkReachable: BehaviorRelay<Bool?> { reachability.isReachable }
    
    private let gitHubRepoManager = ReposNetworkingManger(repoType: .gitHub)
    private let bitbucketRepoManager = ReposNetworkingManger(repoType: .bitbucket)
    
    // MARK: - Initializers
    
    init(reachability: Reachability) {
        self.reachability = reachability
        super.init()
        bindInternetReachability()
        fetchBitbucketRepo()
        fetchGitHubRepo()
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
    
    private func fetchBitbucketRepo() {
        bitbucketRepoManager.fetchRepos(success: { [weak self] model in
            guard let self = self else { return }
            var userModels = self.userModels.value
            userModels.append(contentsOf: model)
            self.userModels.accept(userModels)
        }, error: { [weak self] error in
            self?.errorAppeared?()
        })
    }
    
    private func fetchGitHubRepo() {
        gitHubRepoManager.fetchRepos(success: { [weak self] model in
            guard let self = self else { return }
            var userModels = self.userModels.value
            userModels.append(contentsOf: model)
            self.userModels.accept(userModels)
        }, error: { [weak self] error in
            self?.errorAppeared?()
        })
    }
    
}
