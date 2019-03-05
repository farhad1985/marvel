//
//  File.swift
//  Marvel
//
//  Created by Farhad Faramarzi on 3/5/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import Foundation

struct CharacterDataWrapper: Codable {
    
    var attributionHTML: String
    var attributionText: String
    let code: Int
    var copyright: String
    var data : CharacterDataContainer
    var etag: String
    var status: String
}

struct CharacterDataContainer: Codable {
    let offset, limit, total, count: Int
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name, description: String
    let modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLElement]
}

struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

struct ComicsItem: Codable {
    let resourceURI: String
    let name: String
}

struct Stories: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

struct StoriesItem: Codable {
    let resourceURI: String
    let name, type: String
}

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

struct URLElement: Codable {
    let type: String
    let url: String
}
