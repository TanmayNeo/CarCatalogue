//
//  TableHeaderSearchView.swift
//  CarCatalogue
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import UIKit

protocol CustomSearchBarDelegate {
    func searchBarTextDidChange(_ searchText: String)
    func searchBarCancelButtonClicked()
}

class TableHeaderSearchView: UITableViewHeaderFooterView {
    @IBOutlet var searchBar: UISearchBar!
    var searchDelegate: CustomSearchBarDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        searchBar.barTintColor = UIColor.white
        searchBar.backgroundColor = UIColor.white

        searchBar.searchTextField.textColor = UIColor.black
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: StringConstants.searchPlaceholder,
            attributes: [.foregroundColor: UIColor.gray]
        )
        searchBar.searchTextField.backgroundColor = UIColor.white
        searchBar.searchTextField.tintColor = UIColor.systemBlue

        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
            .setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }

 
    func clearSearch() {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        self.searchBar.resignFirstResponder()
    }
}

extension TableHeaderSearchView : UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {        searchDelegate?.searchBarTextDidChange(searchText)
        //searchBar.showsCancelButton = !searchText.isEmpty
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        clearSearch()
        searchDelegate?.searchBarCancelButtonClicked()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
}

