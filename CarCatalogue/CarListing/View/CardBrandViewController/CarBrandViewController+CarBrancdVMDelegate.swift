//
//  CarBrandViewController+CarBrancdVMDelegate.swift
//  CarCatalogue
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import Foundation
import UIKit

//MARK: - CarBrandViewModel Delegate Methods
extension CarBrandViewController: CarBrandViewModelDelegate {
    
    func didFinishVehicleLoading() {
        DispatchQueue.main.async {
            self.carBrandTableView.backgroundView = nil
            self.tableHeaderView?.setupData(with: self.viewModel.brands)
            self.carBrandTableView.reloadData()
        }
    }
    
    func didFailVehicleLoading(error: String) {
        noDataLabel.text = error
        carBrandTableView.backgroundView = noDataLabel
        self.carBrandTableView.reloadData()
    }
}

