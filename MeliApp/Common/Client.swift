//
//  Client.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 19/07/22.
//

import Foundation
import Combine

enum NetworkError: Error {
    case badUrl
    case invalidResponse
    case dataLoadingError(statusCode: Int, data: Data)
    case jsonDecodingError
    case badRequest(message: String)
    case unAuthorized
    case unknown
}

enum HTTPMethod: String {
    case get = "GET"
}

protocol ClientProtocol {
    func get(urlString: String)-> URLRequest?
    func run(_ requets: URLRequest) -> URLSession.DataTaskPublisher
}

struct Client: ClientProtocol {
    
    func run(_ requets: URLRequest) -> URLSession.DataTaskPublisher {
        return  URLSession.shared.dataTaskPublisher(for: requets)
    }
    
    func get(urlString: String)-> URLRequest? {
        
        guard let url =  URL(string: urlString) else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return urlRequest
    }
}

extension Publisher {
    
    static func empty() -> AnyPublisher<Output, Failure> {
        return Empty().eraseToAnyPublisher()
    }
    
    static func just(_ output: Output) -> AnyPublisher<Output, Failure> {
        return Just(output)
            .catch { _ in AnyPublisher<Output, Failure>.empty() }
            .eraseToAnyPublisher()
    }
    
}
