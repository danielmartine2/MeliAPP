//
//  AutosuggestResponse.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 22/07/22.
//

import Foundation

struct AutosuggestResponse: Codable {
    let suggestedQueries: [SuggestedQuery]

    enum CodingKeys: String, CodingKey {
        case suggestedQueries = "suggested_queries"
    }
}
