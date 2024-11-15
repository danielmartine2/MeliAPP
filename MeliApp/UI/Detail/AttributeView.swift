//
//  AttributesView.swift
//  MeliApp
//
//  Created by Daniel Eduardo Martinez Herrera on 21/07/22.
//

import SwiftUI

struct AttributeView: View {
    var attribute: Attribute
    var body: some View {
        HStack(alignment: .center, spacing: 0.0){
            Text(attribute.name)
                .font(.custom("Nunito-Bold", size: 14))
                .foregroundColor(Color(UIColor(named: "textColor") ?? .red))
                .padding(.trailing, 5)
            Spacer()
            Text(attribute.valueName ?? "")
                .font(.custom("Nunito-Regular", size: 12))
                .foregroundColor(Color(UIColor(named: "textDarkColor") ?? .red))
                .padding(.trailing, 5)
        }
    }
}

struct AttributesView_Previews: PreviewProvider {
    static var previews: some View {
        let mockAttribute = Attribute(
            id: "001",
            name: "Color",
            valueID: "red",
            valueName: "Red"
        )
        AttributeView(attribute: mockAttribute)
    }
}
