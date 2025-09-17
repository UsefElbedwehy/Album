//
//  PhotosService.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import Foundation

final class PhotosService {
    let service: NetworkSerivce
    let albumId: Int
    
    init(service: NetworkSerivce, albumId: Int) {
        self.service = service
        self.albumId = albumId
    }
    
    func fetchPhotosFromApi(albumId: Int,completion: @escaping (Result<[PhotosModel], ApiError>) -> Void) {
        service.fetchDataFromApi(target: .getPhotos(albumId: albumId), completion: completion)
    }
}
