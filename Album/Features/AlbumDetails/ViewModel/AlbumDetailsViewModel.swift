//
//  AlbumDetailsViewModel.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import Foundation

final class AlbumDetailsViewModel {
    private let service: PhotosService
    private(set) var filetedArray: [PhotosModel] = []
    
    var bindPhotosToViewController: (()->()) = {}
    
    private(set) var photosFinalResult: [PhotosModel]? {
        didSet {
            bindPhotosToViewController()
        }
    }
    
    init(service: PhotosService) {
        self.service = service
    }
    
    func getPhotosData(albumId: Int) {
        service.fetchPhotosFromApi(albumId: albumId) { result in
            switch result {
            case .success(let photos):
                print("Photos: \(photos)")
                self.photosFinalResult = photos
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

extension AlbumDetailsViewModel {
    func searchPhotos(with searchText: String) {
        if searchText.isEmpty {
            filetedArray = photosFinalResult ?? []
        } else {
            filetedArray = photosFinalResult?.filter { $0.title.lowercased().contains(searchText.lowercased()) } ?? []
        }
    }
    
    func resetFilteredPhotos() {
        filetedArray = photosFinalResult ?? []
    }
}
