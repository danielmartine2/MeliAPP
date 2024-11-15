//
//  SuggestionContentView.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 27/07/22.
//

import SwiftUI
import Swinject

struct SuggestionContentView: View {
    @EnvironmentObject private var searchViewModel: SearchViewModel
    let action: (String) -> Void
    
    var body: some View {
        if searchViewModel.isSearching {
            VStack {
                ForEach(searchViewModel.suges, id: \.self) { suges in
                    if let sugesSafe = suges.q {
                        Button {
                            action(sugesSafe)
                        } label: {
                            SuggestionRow(suggestion: sugesSafe, isLast: sugesSafe == searchViewModel.suges.last?.q)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
        }
    }
}

struct SuggestionContentView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionContentView { _ in }
            .environmentObject(Assembler.sharedAssembly.resolver.resolve(SearchViewModel.self)!)
    }
}
