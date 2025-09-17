//
//  PhotosCollectionViewDataSource.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import Foundation
import UIKit
import SDWebImage

extension AlbumDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filetedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! GridCollectionViewCell
        cell.photoImgView.sd_setImage(with: URL(string: viewModel.photosFinalResult?[indexPath.row].thumbnailUrl ?? ""), placeholderImage: UIImage(systemName: "heart.fill"))
        return cell
    }
}
