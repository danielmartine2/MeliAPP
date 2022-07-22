//
//  SearchRepositoryImpl.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 20/07/22.
//

import Foundation

struct SearchRepositoryImpl: SearchRepository {
    
    var dataSource: SearchDataSource
    
    func getSearch(query: String) async throws -> SearchResponse {
        let _search =  try await dataSource.getSearch(query: query)
        return _search
    }
}
