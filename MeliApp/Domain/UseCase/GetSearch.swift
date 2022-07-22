//
//  GetSearch.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 20/07/22.
//

import Foundation

protocol GetSearch {
    func execute(query: String) async -> Result<SearchResponse, NetworkError>
}

struct GetSearchUseCase: GetSearch {
    
    var repository: SearchRepository
    
    func execute(query: String) async -> Result<SearchResponse, NetworkError> {
        do{
            let result = try await repository.getSearch(query: query)
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
