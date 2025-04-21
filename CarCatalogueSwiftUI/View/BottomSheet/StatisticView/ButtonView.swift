//
//  ButtonView.swift
//  CarCatalogueSwiftUI
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import SwiftUI

struct ButtonView: View {
    @Binding var showStatistics: Bool
    var startCalculateStatistics: () -> Void

    var body: some View {
        Button(action: {
            startCalculateStatistics()
            showStatistics.toggle()
        }) {
            Image("floatButton")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(10)
                .background(Color.accentColor)
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.6),
                        radius: 5, x: 0, y: 4)
        }
        .frame(width: 60, height: 60)
        .padding(.trailing, 20)
        .padding(.bottom, 20)
    }
}

