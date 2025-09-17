//
//  NetworkService.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import Moya

protocol NetworkSerivce {
    func fetchDataFromApi<T: Codable>(
        target: ApiHandler,
        completion: @escaping (Result<T, ApiError>) -> Void
    )
}
