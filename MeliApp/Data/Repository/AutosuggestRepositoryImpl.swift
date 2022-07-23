//
//  AutosuggestRepositoryImpl.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 22/07/22.
//

import Foundation

struct AutosuggestRepositoryImpl: AutosuggestRepository {
    
    var dataSource: AutosuggestDataSource
    
    func getAutosuggest(query: String) async throws -> [SuggestedQuery] {
        let _suges =  try await dataSource.getAutosuggest(query: query)
        return _suges
    }
}

