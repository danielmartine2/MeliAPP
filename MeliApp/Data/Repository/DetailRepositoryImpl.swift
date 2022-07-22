//
//  DetailRepositoryImpl.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 21/07/22.
//

import Foundation

struct DetailRepositoryImpl: DetailRepository {
    
    var dataSource: DetailDataSource
    
    func getDetail(idItem: String) async throws -> DetailResponse {
        let _detail =  try await dataSource.getDetail(idItem: idItem)
        return _detail
    }
}
