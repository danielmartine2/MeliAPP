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
            SearchContentView()
            .navigationTitle("MeliApp")
            .searchable(text: self.$searchViewModel.query, placement: .navigationBarDrawer(displayMode: .always), prompt: "Buscar", suggestions: {
                SuggestionContentView(action:{ sugges in
                    self.searchViewModel.query = sugges
                    getSearch()
                    hideKeyboard()
                })
            }).disableAutocorrection(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onSubmit(of: .search) {
            getSearch()
        }
        .onChange(of: self.searchViewModel.query, perform: { newValue in
            if newValue.isEmpty {
                self.searchViewModel.searchResults = []
            }else{
                if !self.searchViewModel.isLoading {
                    getSuges()
                }
            }
        })
        .alert("¡Ups!", isPresented: $searchViewModel.hasError) {
        } message: {
            Text("Hubo un problema al obtener los resultaados de la búsqueda. Por favor inténtelo mas tarde")
        }
        .alert("Sin resultados", isPresented: $searchViewModel.isEmpty) {
        } message: {
            Text( "No hay resultados para tu búsqueda, prueba con otras palabras claves")
        }
    }
    
    private func getSearch() {
            resetSuges()
        self.searchViewModel.isLoading = true
        Task {
            await searchViewModel.getSearch()
        }
    }
    
    private func  getSuges() {
        Task {
            await searchViewModel.getAutosuggest()
        }
    }
    
    private func resetSuges() {
        self.searchViewModel.isSearching = false
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
