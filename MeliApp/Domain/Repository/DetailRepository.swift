//
//  DetailRepository.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 19/07/22.
//

import Foundation
import Combine

protocol DetailRepository {
    func getDetail(idItem: String) async throws -> DetailResponse
}
