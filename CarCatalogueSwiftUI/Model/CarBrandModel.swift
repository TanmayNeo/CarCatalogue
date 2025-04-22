//
//  CarBrandModel.swift
//  CarCatalogueSwiftUI
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import Foundation

struct CarBrandResponse: Codable {
    let carBrands: [CarBrand]?
}

struct CarBrand: Identifiable, Codable {
    let id: String?
    let brandName: String?
    let manufacturer: String?
    let models: [CarModel]?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case brandName = "brandName"
        case manufacturer = "manufacturer"
        case models = "models"
        case imageUrl = "imageUrl"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.brandName = try container.decodeIfPresent(String.self, forKey: .brandName)
        self.manufacturer = try container.decodeIfPresent(String.self, forKey: .manufacturer)
        self.models = try container.decodeIfPresent([CarModel].self, forKey: .models)
        self.imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
    }
}

struct CarModel: Hashable,Identifiable, Codable {
    var id: String?
    var modelName: String?
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case modelName = "modelName"
        case imageUrl = "imageUrl"
    }
    
    init(id: String, modelName: String, imageUrl: String) {
        self.id = id
        self.modelName = modelName
        self.imageUrl = imageUrl
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.modelName = try container.decodeIfPresent(String.self, forKey: .modelName)
        self.imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
    }
}

struct CharacterCount: Identifiable {
    var id = UUID()
    let character: Character?
    let count: Int?
}


