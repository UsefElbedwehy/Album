//
//  ApiHandler.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import Foundation
import Moya

enum ApiHandler {
    case getUser(id: Int)
    case getAlbums(userId: Int)
    case getPhotos(albumId: Int)
}

extension ApiHandler : TargetType {
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .getUser(let id):
            return "/users/\(id)"
        case .getAlbums(_):
            return "/albums"
        case .getPhotos(_):
            return "/photos"
        }
    }

    var method: Moya.Method {
            switch self {
            case .getUser:
                return .get
            case .getAlbums:
                return .get
            case .getPhotos:
                return .get
            }
        }
    
    var task: Moya.Task {
        switch self {
        case .getUser:
            return .requestPlain
        case .getAlbums(let userId):
            return .requestParameters(parameters: ["userId": userId], encoding: URLEncoding.queryString)
        case .getPhotos(let albumId):
            return .requestParameters(parameters: ["albumId": albumId], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
