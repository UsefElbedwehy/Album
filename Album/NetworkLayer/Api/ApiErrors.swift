//
//  ApiErrors.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import Foundation
import Moya

enum ApiError: Error {
    case invalidResponse
    case invalidData
    case invalidURL
    case unableToComplete
    case JSONDecodingFailed(_ error: String)
    case moyaError(MoyaError)
}
