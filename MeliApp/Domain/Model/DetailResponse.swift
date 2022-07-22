//
//  DetailResponse.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 19/07/22.
//

import Foundation

struct DetailResponse : Codable {
    let id, title: String
    let price: Int
    let thumbnail: String
    let pictures: [Picture]
    let location: Location
    let attributes: [Attribute]
    let dateCreated, lastUpdated: String

    enum CodingKeys: String, CodingKey {
        case id, title, price, thumbnail, pictures, location, attributes
        case dateCreated = "date_created"
        case lastUpdated = "last_updated"
    }
}
