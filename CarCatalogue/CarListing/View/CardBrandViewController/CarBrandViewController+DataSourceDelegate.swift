//
//  CarBrandViewController+DataSourceDelegate.swift
//  CarCatalogue
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import Foundation
import UIKit

extension CarBrandViewController: UITableViewDataSource {
    //MARK: - TableView Delegate and DataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.carModelListIdentifier, for: indexPath) as? CarModelListTableViewCell else {return UITableViewCell() }
        cell.setData(car: viewModel.cars[indexPath.row])
        return cell
    }
}

extension CarBrandViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        SizeConstants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CellIdentifiers.tableHeaderIdentifier) as? TableHeaderSearchView
        header?.searchDelegate = self
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        SizeConstants.headerHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        CGFloat.leastNonzeroMagnitude
    }
    
}


