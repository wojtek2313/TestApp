//
//  UserModel.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import Foundation

struct UserModel {
    let name: String
    let repoName: String
    let avatarUrl: String
    let description: String?
    let cellType: DescrptionCellType
    
    // MARK: - Initilaizers
    
    init(bitbucketRepoApiModel: BitbucketRepoValuesApiModel) {
        self.name = bitbucketRepoApiModel.owner.displayName
        self.repoName = bitbucketRepoApiModel.name
        self.avatarUrl = bitbucketRepoApiModel.owner.links.href
        self.description = bitbucketRepoApiModel.description
        self.cellType = .bitbucket
    }
    
    init(gitHubRepoApiModel: GitHubRepoApiModel) {
        self.name = gitHubRepoApiModel.owner.login
        self.repoName = gitHubRepoApiModel.name
        self.avatarUrl = gitHubRepoApiModel.owner.avatarUrl
        self.description = gitHubRepoApiModel.description
        self.cellType = .gitHub
    }
}
