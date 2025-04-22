//
//  CustomCellView.swift
//  CarCatalogueSwiftUI
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import SwiftUI

struct CustomCellView: View {
    let title: String
    let image: String

    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: SizeConstants.carImageWidth)
                .padding(.horizontal, 10)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(FontSizeClass.extraLarge)
                    .padding(.vertical, 2.5)
                    .foregroundColor(Color.fontColor)
            }
            .padding(.horizontal, 5)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: SizeConstants.customCellHeight)
        .background(Color(Color.cellColor))
        .cornerRadius(SizeConstants.radius)
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
        .shadow(color: Color.cellColor, radius: 4)
    }
}

struct CustomCellView_Preview: PreviewProvider {
    static var previews: some View {
        CustomCellView(title: Strings.carName, image: Strings.imageName)

    }
}



