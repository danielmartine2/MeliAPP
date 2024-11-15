//
//  SuggestionRow.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 14/11/24.
//
import SwiftUI

struct SuggestionRow: View {
    let suggestion: String
    let isLast: Bool

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "magnifyingglass")
                Text(suggestion)
                    .font(.custom("Nunito-SemiBold", size: 16))
                    .foregroundColor(Color(UIColor(named: "textColor") ?? .black))
                Spacer()
            }
            if !isLast {
                Divider()
            }
        }
    }
}
