//
//  ReposNetworkingManager.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import Foundation

public enum Error: Swift.Error {
    case wrongStatusCode
    case defaultError
    case noData
    case mapError
}

// MARK: - ReposNetworkingManager Protocol

protocol ReposNetworkingManagerProtocol {
    func fetchRepos(success: @escaping (([UserModel]) -> Void), error: @escaping ((Error) -> Void))
}

// MARK: - ReposNetworkingManager Class

class ReposNetworkingManger: NetworkModule.ReposManager {
    
    // MARK: - Private Properties
    
    private let repoType: RepoType
    
    // MARK: - Initializers
    
    init(repoType: RepoType) {
        self.repoType = repoType
    }
    
    // MARK: - Public Methods
    
    func fetchRepos(success: @escaping (([UserModel]) -> Void), error: @escaping ((Error) -> Void)) {
        guard let url = repoType.url else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, response, err in
            if let _ = err {
                DispatchQueue.main.async {
                    error(.defaultError)
                }
            }
            
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                error(.wrongStatusCode)
                return
            }
            
            do {
                guard let data = data else {
                    DispatchQueue.main.async {
                        error(.defaultError)
                    }
                    return
                }
                if let model = self?.repoType.mapToModel(from: data) {
                    DispatchQueue.main.async {
                        success(model)
                    }
                } else {
                    DispatchQueue.main.async {
                        error(.defaultError)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
