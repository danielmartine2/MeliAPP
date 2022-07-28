//
//  SearchContentView.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 24/07/22.
//

import SwiftUI

struct SearchContentView: View {
    
    @EnvironmentObject private var searchViewModel: SearchViewModel
    @Environment(\.isSearching) var isSearching
    @Environment(\.dismissSearch) var dismissSearch
    
    var body: some View {
        VStack {
            if self.searchViewModel.isLoading {
                ProgressView()
            }else if self.searchViewModel.searchResults.isEmpty {
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Búsqueda")
                            .font(.custom("Nunito-Regular", size: 20))
                            .foregroundColor(Color(UIColor(named: "textColor") ?? .red))
                            .padding(.trailing, 5)
                        Text("Aquí encontrarás los resultados de tu búsqueda")
                            .font(.custom("Nunito-SemiBold", size: 14))
                            .foregroundColor(Color(UIColor(named: "textColor")!))
                            .padding(.trailing, 5)
                    }
                    Spacer()
                }
                Spacer()
            }else{
                List {
                    ForEach(self.searchViewModel.searchResults, id: \.id) { item in
                        NavigationLink {
                            DetailView(idDetail: item.id).environmentObject(DetailViewModel(getDetailUseCase: GetDetailUseCase(repository: DetailRepositoryImpl(dataSource: DetailApiImpl()))))
                        } label: {
                            ItemSearchView(itemData: item)
                        }
                    }
                }
            }
        }
    }
}

struct SearchContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchContentView()
    }
}
