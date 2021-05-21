//
//  BitbucketRepoApiModel.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import Foundation

struct BitbucketRepoApiModel: Decodable {
    let values: [BitbucketRepoValuesApiModel]
}

struct BitbucketRepoValuesApiModel: Decodable {
    let owner: BitbucketRepoOwnerApiModel
    let description: String?
    let name: String
}

struct BitbucketRepoOwnerApiModel: Decodable {
    let displayName: String
    let links: BitbucketRepoLinksApiModel
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name", links
    }
}

struct BitbucketRepoLinksApiModel: Decodable {
    let href: String
    
    enum CodingKeys: String, CodingKey {
        case avatar, href
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let avatar = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .avatar)
        href = try avatar.decode(String.self, forKey: .href)
    }
}
