//
//  MainAssembly.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 20/07/22.
//

import Foundation
import Swinject

extension Assembler {
    
    static let sharedAssembly: Assembler = {
        
        let container = Container()
        let assembler = Assembler([
            SearchAssembly()
        ],container: container)
        
        return assembler
        
    }()
    
    
}
