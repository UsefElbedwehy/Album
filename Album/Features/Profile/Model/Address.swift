//
//  Address.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

struct Address: Codable {
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: Geo?
}

struct Geo: Codable {
    let lat: String?
    let lng: String?
}
