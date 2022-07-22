//
//  ServiceApi.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 20/07/22.
//

import Foundation

protocol SearchDataSource {
    func getSearch(query: String) async throws -> SearchResponse
}

