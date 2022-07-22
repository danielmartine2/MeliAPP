//
//  Extentions.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 21/07/22.
//

import Foundation

extension Date {
    func getFormattedDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: dateString) ?? Date()
        dateFormatter.dateFormat = "MMM dd,yyyy"
        return dateFormatter.string(from: date)
    }
}
