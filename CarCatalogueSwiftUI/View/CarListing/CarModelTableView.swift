//
//  CarModelTableView.swift
//  CarCatalogueSwiftUI
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import SwiftUI

struct CarModelsTableView: View {
    @Binding var searchText: String
    let models: [CarModel]
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 5, pinnedViews: [.sectionHeaders]) {
            Section(header: SearchBarView(searchText: $searchText)) {
                if models.isEmpty {
                    Spacer(minLength: 50)
                    Text(Strings.noMatch)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.cellColor)
                        .font(FontSizeClass.largeBold)
                } else {
                    ForEach(models) { model in
                        CustomCellView(title: model.modelName ?? "", subtitle: model.price ?? "", image: model.imageUrl ?? "")
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                            .background(Color.clear)
                    }
                }
            }
            .padding(.horizontal, 10)
        }
        .padding(.bottom, 10)
        .padding(.top, 5)
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
    }
}

struct CarModelsTableView_Previews: PreviewProvider {
    static var previews: some View {
        let carModel = CarModel(id: "1", modelName: Strings.carName, imageUrl: Strings.imageName, price: Strings.imageName)
        CarModelsTableView(searchText: .constant(""), models: [carModel])
        
    }
}

