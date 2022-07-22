//
//  SearchView.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 20/07/22.
//

import SwiftUI
import Swinject

struct SearchView: View {
    
    @EnvironmentObject private var searchViewModel: SearchViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if self.searchViewModel.isLoading {
                    ProgressView()
                }else if self.searchViewModel.searchResults.isEmpty {
                    Text("Búsqueda")
                        .font(.custom("Nunito-Regular", size: 20))
                        .foregroundColor(Color(UIColor(named: "textColor") ?? .red))
                        .padding(.trailing, 5)
                    Text("Aquí encontrarás los resultados de tu búsqueda")
                        .font(.custom("Nunito-SemiBold", size: 14))
                        .foregroundColor(Color(UIColor(named: "textColor")!))
                        .padding(.trailing, 5)
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
            .navigationTitle("MeliApp")
            .searchable(text: self.$searchViewModel.query, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: self.searchViewModel.query, perform: { newValue in
                if newValue.isEmpty {
                    self.searchViewModel.searchResults = []
                }
            })
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onSubmit(of: .search) {
            self.searchViewModel.isLoading = true
            filterRecipes()
        }
        .alert("¡Ups!", isPresented: $searchViewModel.hasError) {
        } message: {
            Text("Hubo un problema al obtener los resultaados de la búsqueda. Por favor inténtelo mas tarde")
        }
        .alert("Sin resultados", isPresented: $searchViewModel.isEmpty) {
        } message: {
            Text( "No hay resultados para tu búsqueda, prueba con otras palabras claves")
        }
    }
    
    func  filterRecipes () {
        Task {
            await searchViewModel.getSearch()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
