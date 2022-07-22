//
//  DetailDataSource.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 21/07/22.
//

import Foundation

protocol DetailDataSource {
    func getDetail(idItem: String) async throws -> DetailResponse
}
