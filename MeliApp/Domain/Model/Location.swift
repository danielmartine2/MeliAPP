//
//  Location.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 19/07/22.
//

import Foundation

// MARK: - Location
struct Location: Codable {
    let state: Sort?

    enum CodingKeys: String, CodingKey {
        case state
    }
}
