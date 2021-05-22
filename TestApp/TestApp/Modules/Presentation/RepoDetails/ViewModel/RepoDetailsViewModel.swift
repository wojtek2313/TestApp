//
//  RepoDetailsViewModel.swift
//  TestApp
//
//  Created by Wojciech Kulas on 22/05/2021.
//

import RxCocoa
import RxSwift

// MARK: - Protocol

protocol RepoDetailsViewModelProtocol {
    var onBackButtonTapped: (() -> Void)? { get set }
    var userModel: UserModel { get set }
}

// MARK: - Class

class RepoDetailsViewModel: RepoDetailsModule.ViewModel {
    // MARK: - Navigation CallBack
    
    public var onBackButtonTapped: (() -> Void)?
    
    // MARK: - Public Properties
    
    public var userModel: UserModel
    
    // MARK: - Initializers
    
    init(userModel: UserModel) {
        self.userModel = userModel
    }
}
