//
//  SearchResult.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 19/07/22.
//

import Foundation

// MARK: - Welcome
struct SearchResponse: Codable {
    let countryDefaultTimeZone, query: String
    let paging: Paging
    let results: [SearchResult]

    enum CodingKeys: String, CodingKey {
        case countryDefaultTimeZone = "country_default_time_zone"
        case query, paging, results
    }
}
