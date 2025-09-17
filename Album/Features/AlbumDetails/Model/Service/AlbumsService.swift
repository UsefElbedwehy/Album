//
//  AlbumsService.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import Foundation

final class AlbumsService {
    let service: NetworkSerivce
    let userRandomId: Int

    init(service: NetworkSerivce, userRandomId: Int) {
        self.service = service
        self.userRandomId = userRandomId
    }
    
    func fetchAlumsFromApi(completion: @escaping (Result<[AlbumsModel], ApiError>) -> Void) {
        service.fetchDataFromApi(target: .getAlbums(userId: userRandomId), completion: completion)
    }
}
