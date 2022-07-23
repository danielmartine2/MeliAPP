//
//  GetAutosuggest.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 22/07/22.
//

import Foundation

protocol GetAutosuggest {
    func execute(query: String) async -> Result<[SuggestedQuery], NetworkError>
}

struct GetAutosuggestUseCase: GetAutosuggest {
    
    var repository: AutosuggestRepository
    
    func execute(query: String) async -> Result<[SuggestedQuery], NetworkError> {
        do{
            let result = try await repository.getAutosuggest(query: query)
            return .success(result)
        }catch(let error){
            switch(error){
            case NetworkError.invalidResponse:
                return .failure(.invalidResponse)
            case NetworkError.badRequest(let message):
                return .failure(.badRequest(message: message))
            case NetworkError.jsonDecodingError:
                return .failure(.jsonDecodingError)
            default:
                return .failure(.unknown)
            }
        }
    }
}
