//
//  SuggestionContentView.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 27/07/22.
//

import SwiftUI

struct SuggestionContentView: View {
    
    @EnvironmentObject private var searchViewModel: SearchViewModel
    let action: (String) -> Void
    
    var body: some View {
        if self.searchViewModel.isSearching {
            VStack{
                ForEach(self.searchViewModel.suges, id: \.self){ suges in
                    if let sugesSafe = suges.q {
                        Button {
                            action(sugesSafe)
                        } label: {
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    Text("\(sugesSafe)")
                                        .font(.custom("Nunito-SemiBold", size: 16))
                                        .foregroundColor(Color(UIColor(named: "textColor")!))
                                    Spacer()
                                }
                                if sugesSafe != self.searchViewModel.suges.last?.q {
                                    Divider()
                                }
                            }
                        }.buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
        }
    }
}

struct SuggestionContentView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionContentView { _ in }
    }
}
