//
//  CustomFlowLayout.swift
//  CarCatalogue
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        let itemWidth = collectionView.frame.width
        itemSize = CGSize(width: itemWidth, height: collectionView.frame.height)
        scrollDirection = .horizontal
        minimumLineSpacing = 0
    }
    
}
