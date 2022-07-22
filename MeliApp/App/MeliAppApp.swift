//
//  MeliAppApp.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 18/07/22.
//

import SwiftUI
import Swinject

@main
struct MeliAppApp: App {
    
    let searchViewModel: SearchViewModel
    
    init() {
        searchViewModel = Assembler.sharedAssembly.resolver.resolve(SearchViewModel.self)!
    }
    
    var body: some Scene {
        WindowGroup {
            SearchView().environmentObject(searchViewModel)
        }
    }
}
