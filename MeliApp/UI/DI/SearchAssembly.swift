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
        
        container.register(SearchDataSource.self){ (resolver) -> SearchApiImpl in
            SearchApiImpl(url: EndPoints.search)
        }
        
        container.register(SearchRepository.self){ resolver -> SearchRepositoryImpl in
            SearchRepositoryImpl(dataSource: resolver.resolve(SearchDataSource.self)!)
        }
        
        container.register(GetSearch.self) { (resolver) -> GetSearchUseCase in
            GetSearchUseCase(repository: resolver.resolve(SearchRepository.self)!)
        }
        
        container.register(SearchViewModel.self) { (resolver) -> SearchViewModel in
            SearchViewModel(getSearchUseCase: resolver.resolve(GetSearch.self)!)
        }
    }
}
