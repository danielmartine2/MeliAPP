//
//  Picture.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 19/07/22.
//

import Foundation

// MARK: - Picture
struct Picture: Codable, Hashable {
    let id: String
    let url: String
    let secureURL: String

    enum CodingKeys: String, CodingKey {
        case id, url
        case secureURL = "secure_url"
    }
}
