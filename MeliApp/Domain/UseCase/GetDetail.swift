//
//  GetDetail.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 21/07/22.
//

import Foundation

protocol GetDetail {
    func execute(idItem: String) async -> Result<DetailResponse, NetworkError>
}

struct GetDetailUseCase: GetDetail {
    
    var repository: DetailRepository
    
    func execute(idItem: String) async -> Result<DetailResponse, NetworkError> {
        do{
            let result = try await repository.getDetail(idItem: idItem)
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
