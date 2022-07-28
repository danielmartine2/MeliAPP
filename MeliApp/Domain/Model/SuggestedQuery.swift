//
//  SuggestedQuery.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 22/07/22.
//

import Foundation

struct SuggestedQuery: Codable, Hashable {
    let id: UUID = UUID()
    let q: String?

    enum CodingKeys: String, CodingKey {
        case q
    }
}
