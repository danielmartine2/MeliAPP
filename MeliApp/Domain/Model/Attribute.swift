//
//  Attribute.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 19/07/22.
//

import Foundation

// MARK: - Attribute
struct Attribute: Codable {
    let id, name: String
    let valueID, valueName: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
    }
}
