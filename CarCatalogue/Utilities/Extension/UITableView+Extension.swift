//
//  UITableView+Extension.swift
//  CarCatalogue
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import Foundation
import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(withClass cellClass: T.Type) -> T {
        let identifier = String(describing: cellClass)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? T else {
            fatalError("Error: could not dequeue cell with identifier: \(identifier)")
        }
        return cell
    }
    
    func register<T: UITableViewCell>(cellClass: T.Type) {
        let identifier = String(describing: cellClass)
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
}


