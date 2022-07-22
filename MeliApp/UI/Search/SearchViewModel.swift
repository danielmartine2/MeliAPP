//
//  SearchViewModel.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 20/07/22.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    let getSearchUseCase: GetSearch
    
    @Published var searchResults: [SearchResult] = []
    @Published var query: String = ""
    @Published var hasError = false
    @Published var isEmpty = false
    @Published var messageError: String = ""
    @Published var isLoading: Bool = false
    
    init(getSearchUseCase: GetSearch) {
        self.getSearchUseCase = getSearchUseCase
    }
    
    @MainActor
    func getSearch() async {
        let result = await getSearchUseCase.execute(query: self.query)
        self.isLoading = false
        switch result{
        case .success(let result):
            self.searchResults = result.results
            self.isEmpty = self.searchResults.isEmpty
            if self.isEmpty { self.query = ""}
        case .failure(let error):
            hasError = true
            messageError = error.localizedDescription
            self.query = ""
        }
    }
    
}
