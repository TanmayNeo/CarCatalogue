//
//  ContentView.swift
//  CarCatalogueSwiftUI
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showStatistics = false
    @StateObject private var viewModel = CarBrandsViewModel()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                        if !viewModel.brands.isEmpty {
                            BrandImageView(selectedIndex: $viewModel.selectedBrandIndex, brands: viewModel.brands)
                                .onChange(of: viewModel.selectedBrandIndex) {
                                    viewModel.searchText = ""
                                }
                            
                            PageControl(numberOfPages: viewModel.brands.count, currentPage: $viewModel.selectedBrandIndex)
                                .frame(height: 20)
                                .padding(.top, 10)
                            
                            CarModelsTableView(searchText: $viewModel.searchText, models: viewModel.filteredCarModels)
                        } else {
                            Text(Strings.noBrand)
                                .frame(minHeight: 100)
                        }
                    }
                    .padding(2)
                }.background(Color.background)
                .safeAreaPadding(EdgeInsets(.zero))
                ButtonView(showStatistics: $showStatistics, startCalculateStatistics: {
                    viewModel.calculateStatistics()
                })
                    .sheet(isPresented: $showStatistics) {
                        StatisticsSheetView(modelCounts: $viewModel.modelCount, characterCounts: $viewModel.characterCounts)
                    }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

