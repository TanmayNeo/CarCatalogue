//
//  CarBrandViewController.swift
//  CarCatalogue
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import UIKit

class CarBrandViewController: UIViewController {
    
    //MARK: - @IBOutlet & Variables
    @IBOutlet weak var carBrandTableView: UITableView!
    @IBOutlet weak var bottomSheetBtn: UIButton!
    
    var tableHeaderView: CarBrandHeaderView? = .fromNib()
    private var selectedCarBrand: Brand?
    
    var viewModel: CarBrandViewModelProtocol = CarBrandViewModel()
    let noDataLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBottomSheetBtn()
        setupViewModel()
    }
    
    //MARK: - Setup Methods
    private func setupTableView() {
        carBrandTableView.sectionHeaderTopPadding = 0
        carBrandTableView.delegate = self
        carBrandTableView.dataSource = self
        carBrandTableView.register(UINib(nibName: CellIdentifiers.carModelListIdentifier, bundle: nil),forCellReuseIdentifier: CellIdentifiers.carModelListIdentifier)
        setupTableViewHeader()
    }
    
    private func setupBottomSheetBtn() {
        bottomSheetBtn.setTitle("", for: .normal)
        bottomSheetBtn.addTarget(self, action: #selector(showStatistics), for: .touchUpInside)
        bottomSheetBtn.layer.cornerRadius = bottomSheetBtn.frame.height / 2
        
        bottomSheetBtn.layer.shadowColor = UIColor.black.cgColor
        bottomSheetBtn.layer.shadowOpacity = 0.6
        bottomSheetBtn.layer.shadowOffset = CGSize(width: 0, height: 4)
        bottomSheetBtn.layer.shadowRadius = 5
        bottomSheetBtn.layer.masksToBounds = false
    }
    
    private func setupTableViewHeader() {
        carBrandTableView.register(UINib(nibName: CellIdentifiers.tableHeaderIdentifier, bundle: nil),
                                   forHeaderFooterViewReuseIdentifier: CellIdentifiers.tableHeaderIdentifier)
        tableHeaderView?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 150)
        tableHeaderView?.delegate = self
        carBrandTableView.tableHeaderView = tableHeaderView
    }
    
    private func setupViewModel() {
        viewModel.delegate = self
        viewModel.getVehicles()
    }
}

extension CarBrandViewController {
    @objc private func showStatistics() {
        viewModel.getStatistics()
    }
    
    func didUpdateStatistics(modelCounts: [String: Int], characterCounts: [CharacterCount]) {
        let statisticsVC = StatisticsViewController(nibName: "StatisticsViewController", bundle: nil)
        
        if let sheet = statisticsVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 25
        }
        statisticsVC.configure(modelCounts: modelCounts, characterCounts: characterCounts)
        present(statisticsVC, animated: true, completion: nil)
    }
}

