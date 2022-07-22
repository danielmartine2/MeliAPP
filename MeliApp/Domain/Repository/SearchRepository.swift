//
//  SearchRepository.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 19/07/22.
//

import Foundation

protocol SearchRepository {
    func getSearch(query: String) async throws -> SearchResponse
}
