//
//  UserModel.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

struct UserModel: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
}
