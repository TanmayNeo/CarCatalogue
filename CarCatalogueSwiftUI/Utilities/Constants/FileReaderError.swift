//
//  FileReaderError.swift
//  CarCatalogueSwiftUI
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import Foundation

enum FileReaderError: LocalizedError {
    case invalidPath
    case contentError
    case noData
    case noSearchItem
    var localizedDescription: String {
        switch self {
        case .contentError,
                .invalidPath,
                .noData:
            return Strings.noData
        case .noSearchItem:
            return Strings.noMatch
        }
    }
}

