//
//  SheetDetailView.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 21/07/22.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct SheetDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var scale: CGFloat = 1
    @Binding var showingSheet: Bool
    @Binding var urlImage: String
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Rectangle()
                    .fill(Color.black.opacity(0.9))
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    WebImage(url: URL(string: urlImage))
                        .onFailure{ error in
                            print(error)
                        }
                        .resizable()
                        .placeholder {
                            Rectangle().foregroundColor(.gray)
                        }
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .zoomable(scale: $scale)
                }
                
                VStack{
                    Spacer()
                    HStack {
                        Button("Reset") {
                            scale = 1
                        }
                        Spacer()
                        Text("Zoom: \(String(format: "%.02f", scale * 100) )%")
                            .font(.custom("Nunito-Regular", size: 14))
                            .foregroundColor(.white)
                            .padding(.trailing, 5)
                            
                    }
                    .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cerrar", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct SheetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SheetDetailView(showingSheet: .constant(true), urlImage: .constant(""))
    }
}
