//
//  AutosuggestApiImpl.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 22/07/22.
//

import Foundation

struct AutosuggestApiImpl: AutosuggestDataSource {
    
    let url: String
    
    func getAutosuggest(query: String) async throws -> [SuggestedQuery] {
        
        let limit = 20
        
        guard let escapedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            throw NetworkError.badUrl
        }
        
        guard let url = URL(string: "\(url)?limit=\(limit)&q=\(escapedQuery)") else{
            throw NetworkError.badUrl
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else{
            throw NetworkError.badRequest(message: "Bad Request")
        }
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        
        switch(response.statusCode){
        case 200:
            guard let result = try? JSONDecoder().decode(AutosuggestResponse.self, from: data) else {
                throw NetworkError.jsonDecodingError
            }
            return result.suggestedQueries
            
        case 400..<500:
            throw NetworkError.badRequest(message: "Bad Request")
            
        default:
            throw NetworkError.unknown
        }
    }
}

