//
//  PhotosCollectionViewDelegate.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import Foundation
import UIKit

extension AlbumDetailsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let zoomVC = self.storyboard?.instantiateViewController(identifier: "imageViewerVC") as! ImageZoomViewController
        zoomVC.imgUrl = viewModel.photosFinalResult?[indexPath.row].thumbnailUrl ?? ""
        zoomVC.imageId = viewModel.photosFinalResult?[indexPath.row].id ?? 0
        zoomVC.albumId = viewModel.photosFinalResult?[indexPath.row].albumId ?? 0
        self.navigationController?.pushViewController(zoomVC, animated: true)
    }
}
