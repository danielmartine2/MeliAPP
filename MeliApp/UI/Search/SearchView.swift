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
                .searchable(
                    text: $searchViewModel.query,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Buscar"
                ) {
                    SuggestionContentView(action: selectSuggestion)
                }
                .disableAutocorrection(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onSubmit(of: .search) {
            performSearch()
        }
        .onChange(of: searchViewModel.query, perform: handleQueryChange)
        .alert("¡Ups!", isPresented: $searchViewModel.hasError) {
            Button("Aceptar", role: .cancel) { }
        } message: {
            Text("Hubo un problema al obtener los resultados de la búsqueda. Por favor inténtelo más tarde")
        }
        .alert("Sin resultados", isPresented: $searchViewModel.isEmpty) {
            Button("Aceptar", role: .cancel) { }
        } message: {
            Text("No hay resultados para tu búsqueda, prueba con otras palabras clave")
        }
    }

    private func performSearch() {
        resetSuggestions()
        searchViewModel.isLoading = true
        Task {
            await searchViewModel.getSearch()
        }
    }

    private func selectSuggestion(suggestion: String) {
        searchViewModel.query = suggestion
        performSearch()
        hideKeyboard()
    }

    private func handleQueryChange(newValue: String) {
        if newValue.isEmpty {
            searchViewModel.searchResults = []
        } else if !searchViewModel.isLoading {
            fetchSuggestions()
        }
    }

    private func fetchSuggestions() {
        Task {
            await searchViewModel.getAutosuggest()
        }
    }

    private func resetSuggestions() {
        searchViewModel.isSearching = false
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(Assembler.sharedAssembly.resolver.resolve(SearchViewModel.self)!)
    }
}
