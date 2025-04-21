//
//  FileReader.swift
//  CarCatalogueSwiftUI
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import Foundation

class FileReader {
    func decode<T: Decodable>(fromFile fileName: String, type: String) throws -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: type) else {
            throw FileReaderError.invalidPath
         }
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(T.self, from: data)
            return  response
        } catch let error {
            print(error)
            throw FileReaderError.contentError
        }
    }
}

