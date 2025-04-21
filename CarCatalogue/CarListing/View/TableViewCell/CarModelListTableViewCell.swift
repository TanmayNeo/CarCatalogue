//
//  CarModelListTableViewCell.swift
//  CarCatalogue
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import UIKit

class CarModelListTableViewCell: UITableViewCell {

    //MARK: - @IBOutlet & Variables

    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var cellBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(car: Car) {
        cellBackground.setCorner(radius: SizeConstants.radius, borderWidth: SizeConstants.borderWidth, borderColor: .lightText)
        carName.text = car.name ?? ""
        carImage.image = UIImage(named: car.imageUrl ?? "")
    }
}

