//
//  FileReaderError.swift
//  CarCatalogue
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
            return StringConstants.noData
        case .noSearchItem:
            return StringConstants.noMatch
        }
    }
}

