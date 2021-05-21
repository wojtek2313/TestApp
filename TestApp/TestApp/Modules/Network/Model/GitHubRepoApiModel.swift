//
//  GitHubRepoApiModel.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import Foundation

struct GitHubRepoApiModel: Decodable {
    let name: String
    let owner: GitHubRepoOwnerApiModel
    let description: String?
}

struct GitHubRepoOwnerApiModel: Decodable {
    let login: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login, avatarUrl = "avatar_url"
    }
}

