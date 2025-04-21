//
//  VehicleBrandProtocol.swift
//  CarCatalogue
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import Foundation

protocol CarBrandViewModelProtocol {
    func getVehicles()
    func searchVehicles(searchText: String)
    func getVehiclesById(vehicleId: Int)
    func clearVehicleSearch()
    func getStatistics()
    var brands: [Brand] {get}
    var cars: [Car] {get}
    var delegate: CarBrandViewModelDelegate? {get set}
}

protocol CarBrandViewModelDelegate: AnyObject {
    func didFinishVehicleLoading()
    func didFailVehicleLoading(error: String)
    func didUpdateStatistics(modelCounts: [String: Int], characterCounts: [CharacterCount])
}

