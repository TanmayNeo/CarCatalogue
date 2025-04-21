//
//  LaunchScreenView.swift
//  CarCatalogueSwiftUI
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            Image("CarGo")
                .resizable()
                .frame(width: SizeConstants.launchImageWidth, height: SizeConstants.launchImageHeight)
                .aspectRatio(contentMode: .fit)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
