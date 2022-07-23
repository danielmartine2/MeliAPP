//
//  SearchAssembly.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 20/07/22.
//

import Foundation
import Swinject

class SearchAssembly: Assembly {
    func assemble(container: Container) {
        
        //Api
        container.register(AutosuggestDataSource.self){ (resolver) -> AutosuggestApiImpl in
            AutosuggestApiImpl(url: EndPoints.autosuggest)
        }
        
        container.register(SearchDataSource.self){ (resolver) -> SearchApiImpl in
            SearchApiImpl(url: EndPoints.search)
        }
        
        
        //Repository
        container.register(SearchRepository.self){ resolver -> SearchRepositoryImpl in
            SearchRepositoryImpl(dataSource: resolver.resolve(SearchDataSource.self)!)
        }
        
        container.register(AutosuggestRepository.self){ resolver -> AutosuggestRepositoryImpl in
            AutosuggestRepositoryImpl(dataSource: resolver.resolve(AutosuggestDataSource.self)!)
        }
        
        container.register(GetSearch.self) { (resolver) -> GetSearchUseCase in
            GetSearchUseCase(repository: resolver.resolve(SearchRepository.self)!)
        }
        
        container.register(GetAutosuggest.self) { (resolver) -> GetAutosuggestUseCase in
            GetAutosuggestUseCase(repository: resolver.resolve(AutosuggestRepository.self)!)
        }
        
        container.register(SearchViewModel.self) { (resolver) -> SearchViewModel in
            SearchViewModel(getSearchUse: resolver.resolve(GetSearch.self)!, getAutosuggest: resolver.resolve(GetAutosuggest.self)!)
        }
    }
}
