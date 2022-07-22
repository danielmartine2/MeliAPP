//
//  DetailApiImpl.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 21/07/22.
//

import Foundation
import Alamofire

struct DetailApiImpl: DetailDataSource {
    
    func getDetail(idItem: String) async throws -> DetailResponse {
        
        guard let url = URL(string: "\(EndPoints.detail)\(idItem)") else{
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
            let str = String(decoding:data, as: UTF8.self)
            print(str)
            guard let result = try? JSONDecoder().decode(DetailResponse.self, from: data) else {
                throw NetworkError.jsonDecodingError
            }
            return result
            
        case 401:
            throw NetworkError.unAuthorized
            
        case 400..<500:
            throw NetworkError.badRequest(message: "Bad Request")
            
        default:
            throw NetworkError.unknown
        }
    }
}
