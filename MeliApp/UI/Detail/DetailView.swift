//
//  DetailView.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 21/07/22.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject private var detailViewModel: DetailViewModel
    let idDetail: String
    @State private var showingSheet: Bool = false
    @State private var urlImage: String = ""
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .fill(Color(UIColor(named: "backgroundColor")  ?? .red))
                .edgesIgnoringSafeArea(.all)
            
            if self.detailViewModel.isLoading {
                ProgressView()
            }else {
                ScrollView(showsIndicators: false) {
                    
                    VStack{
                        HStack(spacing: 0){
                            Text(self.detailViewModel.detailResult?.location.state?.name ?? "")
                                .font(.custom("Nunito-Regular", size: 14))
                                .foregroundColor(Color(UIColor(named: "textLightColor") ?? .red))
                            Text(" - Publ. \(Date().getFormattedDate(dateString: self.detailViewModel.detailResult?.dateCreated ?? ""))")
                                .font(.custom("Nunito-Regular", size: 14))
                                .foregroundColor(Color(UIColor(named: "textLightColor") ?? .red))
                        }.padding([.top, .horizontal])
                        
                        HStack{
                            SnapCarousel(pictures: self.detailViewModel.pictures, showingSheet: $showingSheet, urlImage: $urlImage).environmentObject(UIStateModel())
                        }.padding(.vertical)
                        
                        HStack(spacing: 0){
                            Text("$ \(self.detailViewModel.detailResult?.price ?? 0)")
                                .font(.custom("Nunito-Bold", size: 20))
                                .foregroundColor(.green)
                                .multilineTextAlignment(.leading)
                                .padding([.horizontal, .bottom], 20)
                            Spacer()
                        }
                        
                        Text("Características")
                            .font(.custom("Nunito-Bold", size: 18))
                            .foregroundColor(Color(UIColor(named: "textColor") ?? .red))
                        
                        VStack(alignment: .leading){
                            ForEach(self.detailViewModel.attributes, id:\.id) { attribute in
                                if attribute.valueName?.lowercased() != "sí".lowercased() && !(attribute.valueName ?? "").isEmpty {
                                    AttributeView(attribute: attribute)
                                    if attribute.id != (self.detailViewModel.attributes.last?.id){
                                        Divider()
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color(UIColor(named: "backgroundCardColor")  ?? .red))
                        )
                        .padding(.horizontal)
                    }
                }
            }
        }.sheet(isPresented: $showingSheet) {
            SheetDetailView(showingSheet: self.$showingSheet, urlImage: self.$urlImage)
        }
        .navigationTitle(self.detailViewModel.detailResult?.title ?? "Detalle")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            self.detailViewModel.isLoading = true
            await detailViewModel.getDetail(idItem: idDetail)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(idDetail: "")
    }
}


