//
//  StatissticsViewController.swift
//  CarCatalogue
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet var CharacterCountLabel: [UILabel]!
    @IBOutlet weak var backgroundView: UIView!
    
    private var modelCounts: [String: Int] = [:]
    private var characterCounts: [CharacterCount] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    func configure(modelCounts: [String: Int], characterCounts: [CharacterCount]) {
        self.modelCounts = modelCounts
        self.characterCounts = characterCounts
    }
    func setupViews() {
        backgroundView.setCorner(radius: SizeConstants.radius, borderWidth: SizeConstants.borderWidth, borderColor: .lightGray)
        brandNameLabel.text = modelCounts.map { "\($0.key): \($0.value) Models" }.joined(separator: "\n")
        
        for (index, label) in CharacterCountLabel.enumerated() {
            if index < characterCounts.count {
                let characterCount = characterCounts[index]
                label.text = "\(characterCount.character ?? " ") :  \(characterCount.count ?? 0)"
            } else {
                label.text = StringConstants.notApplicable
            }
        }
    }
}
