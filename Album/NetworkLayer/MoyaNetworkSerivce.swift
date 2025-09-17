//
//  MoyaNetworkSerivce.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import Foundation
import Combine
import Moya

final class MoyaNetworkService : NetworkSerivce {
    var cancellable = Set<AnyCancellable>()
    var provider = MoyaProvider<ApiHandler>()

    func fetchDataFromApi<T: Codable>(
        target: ApiHandler,
        completion: @escaping (Result<T, ApiError>) -> Void
    ) {
        provider.request(target) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data.data)
                    completion(.success(decodedData))
                } catch let error {
                    completion(.failure(ApiError.JSONDecodingFailed(error.localizedDescription)))
                }
            case .failure(let moyaError):
                completion(.failure(ApiError.moyaError(moyaError)))
            }
        }
    }
}
