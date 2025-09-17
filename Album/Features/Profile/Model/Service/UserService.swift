//
//  UserService.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import Foundation

final class UserService {
    let service: NetworkSerivce
    let userRandomId: Int

    init(service: NetworkSerivce, userRandomId: Int) {
        self.service = service
        self.userRandomId = userRandomId
    }
    
    func fetchUserFromApi(completion: @escaping (Result<UserModel, ApiError>) -> Void) {
        service.fetchDataFromApi(target: .getUser(id: userRandomId), completion: completion)
    }
}
