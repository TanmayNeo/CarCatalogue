//
//  SearchBarView.swift
//  CarCatalogueSwiftUI
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.lightFontColor)
                        .padding(.leading, 5)
                    
                    TextField(Strings.searchPlaceholder, text: $searchText)
                        .foregroundColor(Color.lightFontColor)
                        .padding(5)
                        .onTapGesture {
                            self.isEditing = true
                        }
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                }
                .background(.white)
                .cornerRadius(SizeConstants.radius)
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.searchText = ""
                        // Dismiss keyboard
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }) {
                        Text(Strings.cancel)
                            .font(FontSizeClass.medium)
                            .foregroundColor(Color.cellColor)
                    }
                    .padding(.trailing, 10)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 5)
            .padding(.bottom, 5)
            .shadow(color: Color.cellColor, radius: 4)

        }
    }
}



