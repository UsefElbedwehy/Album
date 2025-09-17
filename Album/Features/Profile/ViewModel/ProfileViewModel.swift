//
//  ProfileViewModel.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import Foundation

final class ProfileViewModel {
    var bindUserToViewController: (()->()) = {}
    var bindAlbumsToViewController: (()->()) = {}
    
    private let userService: UserService
    private let albumsService: AlbumsService
        
    init(
        userService: UserService,
        albumsService: AlbumsService
    ) {
        self.userService = userService
        self.albumsService = albumsService
    }
    
    private(set) var userFinalResult : UserModel! {
        didSet {
            bindUserToViewController()
        }
    }
    
    private(set) var albumsFinalResult : [AlbumsModel]? {
        didSet {
            bindAlbumsToViewController()
        }
    }
    
    
    func getUser() {
        userService.fetchUserFromApi { result in
            switch result {
            case .success(let user):
                self.userFinalResult = user
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    func getAlbums() {
        albumsService.fetchAlumsFromApi { result in
            switch result {
            case .success(let albums):
                self.albumsFinalResult = albums
            case .failure(let error):
                print("Error  view model: \(error)")
            }
        }
    }
}

