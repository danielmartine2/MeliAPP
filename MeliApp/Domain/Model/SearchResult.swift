//
//  SearchResult.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 19/07/22.
//

import Foundation

// MARK: - Result
struct SearchResult: Codable {
    let id: String
    let title: String
    let price: Int
    let thumbnail: String
    let thumbnailId: String
    let location: Location?

    enum CodingKeys: String, CodingKey {
        case id, title, price, thumbnail, location
        case thumbnailId = "thumbnail_id"
    }
}
