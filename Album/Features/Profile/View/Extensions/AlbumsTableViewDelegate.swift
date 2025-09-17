//
//  AlbumsTableViewDelegate.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import Foundation
import UIKit

extension ProfileViewController:  UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photosVC = self.storyboard?.instantiateViewController(identifier: "photosVC") as! AlbumDetailsViewController
        photosVC.albumId = viewModel.albumsFinalResult?[indexPath.row].id ?? 0
        photosVC.AlbumTitle = viewModel.albumsFinalResult?[indexPath.row].title ?? ""
        self.navigationController?.pushViewController(photosVC, animated: true)
    }
}
