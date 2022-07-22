//
//  DetailAssembly.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 21/07/22.
//

import Foundation
import Swinject

class DetailAssembly: Assembly {
    func assemble(container: Container) {
        
        container.register(DetailDataSource.self){ (resolver) -> DetailApiImpl in
            DetailApiImpl()
        }
        
        container.register(DetailRepository.self){ resolver -> DetailRepositoryImpl in
            DetailRepositoryImpl(dataSource: resolver.resolve(DetailDataSource.self)!)
        }
        
        container.register(GetDetail.self) { (resolver) -> GetDetailUseCase in
            GetDetailUseCase(repository: resolver.resolve(DetailRepository.self)!)
        }
        
        container.register(DetailViewModel.self) { (resolver) -> DetailViewModel in
            DetailViewModel(getDetailUseCase: resolver.resolve(GetDetail.self)!)
        }
    }
}
