//
//  BrandImageView.swift
//  CarCatalogueSwiftUI
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import SwiftUI

struct BrandImageView: View {
    @Binding var selectedIndex: Int
    let brands: [CarBrand]
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(brands.indices, id: \.self) { index in
                Image(brands[index].imageUrl ?? "")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .tag(index)
                    .frame(width: SizeConstants.brandImageWeight, height: SizeConstants.brandImageWeight)
                        .aspectRatio(contentMode: .fit)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: SizeConstants.brandFrameHeight)
    }
}


