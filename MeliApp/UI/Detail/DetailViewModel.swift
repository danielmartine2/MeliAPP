//
//  DetailViewModel.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 21/07/22.
//

import Foundation


class DetailViewModel: ObservableObject {
    
    let getDetailUseCase: GetDetail
    
    @Published var detailResult: DetailResponse? = nil
    @Published var pictures: [Picture] = []
    @Published var attributes: [Attribute] = []
    @Published var hasError = false
    @Published var messageError: String = ""
    @Published var isLoading = false
    
    //Carousel
    @Published var activeCard: Int = 0
    @Published var screenDrag: Float = 0.0
    
    init(getDetailUseCase: GetDetail) {
        self.getDetailUseCase = getDetailUseCase
    }
    
    @MainActor
    func getDetail(idItem: String) async {
        let result = await getDetailUseCase.execute(idItem: idItem)
        self.isLoading = false
        switch result{
        case .success(let detailResult):
            self.detailResult = detailResult
            self.pictures =  self.detailResult?.pictures ?? []
            self.attributes =  self.detailResult?.attributes ?? []
        case .failure(let error):
            hasError = true
            print(error.localizedDescription)
        }
    }
    
}
