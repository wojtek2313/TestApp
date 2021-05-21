//
//  RepoType.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import Foundation

enum RepoType {
    case gitHub
    case bitbucket
    
    // MARK: - Public Properties
    
    var url: URL? {
        var components = URLComponents()
        switch self {
        case .gitHub:
            components.scheme = "https"
            components.host = "api.github.com"
            components.path = "/repositories"
            return components.url
        case .bitbucket:
            components.scheme = "https"
            components.host = "api.bitbucket.org"
            components.path = "/2.0/repositories"
            components.queryItems = [URLQueryItem(name: "fields", value: "values.name,values.owner,values.description")]
            return components.url
        }
    }
    
    // MARK: - Public Methods
    
    func mapToModel(from data: Data) -> [UserModel]? {
        switch self {
        case .gitHub:
            do {
                let model = try JSONDecoder().decode([GitHubRepoApiModel].self, from: data)
                return model.map { UserModel(gitHubRepoApiModel: $0) }
            } catch {
                return nil
            }
        case .bitbucket:
            do {
                let model = try JSONDecoder().decode(BitbucketRepoApiModel.self, from: data)
                return model.values.map { UserModel(bitbucketRepoApiModel: $0) }
            } catch {
                return nil
            }
        }
    }
}
