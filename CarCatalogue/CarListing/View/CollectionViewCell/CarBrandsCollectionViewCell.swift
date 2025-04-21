//
//  CarBrandsCollectionViewCell.swift
//  CarCatalogue
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import UIKit

class CarBrandsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var brandImage: UIImageView!
    
    var strImage: String?  {
        didSet {
            setupCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    
    private func setupCell() {
        brandImage.image = UIImage(named:  strImage ?? "Scorpio")
    }
}

