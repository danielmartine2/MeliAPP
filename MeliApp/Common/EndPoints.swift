//
//  EndPoints.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 20/07/22.
//

import Foundation

struct EndPoints {
    static let SITE_ID = "MCO"
    static let BASE_URL = "https://api.mercadolibre.com/"
    //Search urls
    static let search = "\(BASE_URL)sites/\(SITE_ID)/search"
    static let urlImage = "https://http2.mlstatic.com/D_"
    //Detail urls
    static let detail = "\(BASE_URL)items/"
}
