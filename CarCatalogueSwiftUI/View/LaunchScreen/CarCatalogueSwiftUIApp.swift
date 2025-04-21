//
//  CarCatalogueSwiftUIApp.swift
//  CarCatalogueSwiftUI
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import SwiftUI

@main
struct CarCatalogueSwiftUIApp: App {
    @State private var showLaunchScreen = true
    
    var body: some Scene {
        WindowGroup {
            if showLaunchScreen {
                LaunchScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showLaunchScreen = false
                            }
                        }
                    }
            } else {
                ContentView()
            }
        }
    }
}
