//
//  SearchApiImpl.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 19/07/22.
//

import Foundation
import Alamofire

struct SearchApiImpl: SearchDataSource {
    
    let url: String
    
    func getSearch(query: String) async throws -> SearchResponse {
        
        guard let escapedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            throw NetworkError.badUrl
        }
        
        guard let url = URL(string: "\(url)?q=\(escapedQuery)") else{
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
            //print(str)
            
            do {
                let result = try JSONDecoder().decode(SearchResponse.self, from: data)
            } catch {
                print("Decoding error: \(error)")
            }
            
            guard let result = try? JSONDecoder().decode(SearchResponse.self, from: data) else {
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
