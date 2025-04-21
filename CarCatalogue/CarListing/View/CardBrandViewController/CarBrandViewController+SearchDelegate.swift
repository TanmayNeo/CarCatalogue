//
//  CarBrandViewController+SearchDelegate.swift
//  CarCatalogue
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import Foundation
import UIKit

//MARK: - SearchBar Delegate Methods
extension CarBrandViewController: CustomSearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchVehicles(searchText: searchText)
    }
    
    func searchBarTextDidChange(_ searchText: String) {
        viewModel.searchVehicles(searchText: searchText)
    }
    func searchBarCancelButtonClicked() {
        viewModel.clearVehicleSearch()
    }
}

