//
//  SearchBarDelegate.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import Foundation
import UIKit

extension AlbumDetailsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchPhotos(with: searchText)
        self.photosCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Reset the search results
        viewModel.resetFilteredPhotos()
        self.photosCollectionView.reloadData()
    }
}
