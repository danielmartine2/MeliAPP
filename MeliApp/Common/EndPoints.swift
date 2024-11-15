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
    static let BASE_MLSTATIC_URL = "https://http2.mlstatic.com/"
    //Search urls
    static let search = "\(BASE_URL)sites/\(SITE_ID)/search"
    static let urlImage = "\(BASE_MLSTATIC_URL)D_"
    //Detail urls
    static let detail = "\(BASE_URL)items/"
    //Autosuggest urls
    static let autosuggest = "\(BASE_MLSTATIC_URL)resources/sites/\(SITE_ID)/autosuggest"
}
