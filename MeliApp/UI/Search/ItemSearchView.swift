//
//  ItenSearchView.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 20/07/22.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct ItemSearchView: View {
    
    @EnvironmentObject private var apolloViewModel: SearchViewModel
    var itemData: SearchResult
    
    var body: some View {
        HStack(alignment: .center, spacing: 0.0){
            
            WebImage(url: URL(string: "\(EndPoints.urlImage)\(itemData.thumbnailId)-I.jpg"))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width:100, height:100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            VStack(alignment: .leading){
                Text("\(itemData.title)")
                    .font(.custom("Nunito-Regular", size: 14))
                    .foregroundColor(Color(UIColor(named: "textDarkColor") ?? .red))
                    .padding(.trailing, 5)
                Text("$ \(itemData.price)")
                    .font(.custom("Nunito-Bold", size: 14))
                    .foregroundColor(Color(UIColor(named: "textColor")!))
                    .padding(.trailing, 5)
                Text("\(itemData.location?.state?.name ?? "")")
                    .font(.custom("Nunito-Regular", size: 12))
                    .foregroundColor(Color(UIColor(named: "textLightColor")!))
                    .padding(.trailing, 5)
            }.padding(.horizontal, 10)
            
        }
    }
}

struct ItenSearchView_Previews: PreviewProvider {
    static var previews: some View {
        let itemData = getDataSearchResult().results[0]
        ItemSearchView(itemData: itemData).previewLayout(.fixed(width: .infinity, height: 300))
    }
}
