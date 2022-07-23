//
//  AutosuggestDataSource.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 22/07/22.
//

import Foundation

protocol AutosuggestDataSource {
    func getAutosuggest(query: String) async throws -> [SuggestedQuery]
}
