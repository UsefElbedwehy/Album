//
//  PhotosModel.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import Foundation

struct PhotosModel: Codable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
