//
//  AutosuggestRepository.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 22/07/22.
//

import Foundation

protocol AutosuggestRepository {
    func getAutosuggest(query: String) async throws -> [SuggestedQuery]
}
