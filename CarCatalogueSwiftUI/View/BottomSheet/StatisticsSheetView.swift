//
//  StatisticsSheetView.swift
//  CarCatalogueSwiftUI
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import SwiftUI

struct StatisticsSheetView: View {
    @Binding var modelCounts: [String: Int]
    @Binding var characterCounts: [CharacterCount]
    
    var body: some View {
        VStack{
            StatisticsView(modelCount: modelCounts, characterCounts: characterCounts)
        }
        .cornerRadius(20)
        .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
    }
}



