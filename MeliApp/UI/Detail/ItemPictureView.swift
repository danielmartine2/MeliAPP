//
//  ItemPictureView.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 21/07/22.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct ItemPictureView: View {
    
    let urlImage: String
    
    var body: some View {
        NavigationLink(destination: Text("Hola")) {
            ZStack(alignment: .bottomLeading) {
                WebImage(url: URL(string: urlImage))
                    .resizable()
                    .placeholder {
                        Rectangle().foregroundColor(.gray)
                    }
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}

struct ItemPictureView_Previews: PreviewProvider {
    static var previews: some View {
        ItemPictureView(urlImage: "")
    }
}
