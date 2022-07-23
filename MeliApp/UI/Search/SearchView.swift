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
            .navigationTitle("MeliApp")
            .searchable(text: self.$searchViewModel.query, placement: .navigationBarDrawer(displayMode: .always), prompt: "Buscar", suggestions: {
                ForEach(self.searchViewModel.suges, id: \.self){ suges in
                    if let sugesSafe = suges.q {
                     Label("\(sugesSafe)", systemImage: "magnifyingglass")
                            .font(.custom("Nunito-SemiBold", size: 16))
                            .foregroundColor(Color(UIColor(named: "textColor")!))
                            .searchCompletion(sugesSafe)
                    }
                }
            }).disableAutocorrection(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onSubmit(of: .search) {
            resetSuges()
            self.searchViewModel.isLoading = true
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
        self.searchViewModel.suges = []
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
