//
//  CarBrandViewController+HeaderDelegate.swift
//  CarCatalogue
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import Foundation
import UIKit

//MARK: - CarBrandHeader Delegate Methods
extension CarBrandViewController: CarBrandHeaderDelegate {
    func selectedBrandId(id: Int) {
        let headerView = carBrandTableView.headerView(forSection: 0) as? TableHeaderSearchView
        headerView?.clearSearch()
        viewModel.getVehiclesById(vehicleId: id)
    }
}

