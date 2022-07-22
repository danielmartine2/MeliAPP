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
    let attributeGroupID, attributeGroupName: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
        case attributeGroupID = "attribute_group_id"
        case attributeGroupName = "attribute_group_name"
    }
}
