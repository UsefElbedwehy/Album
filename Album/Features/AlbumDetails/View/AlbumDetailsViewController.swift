//
//  AlbumDetailsViewController.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import UIKit

class AlbumDetailsViewController: UIViewController {

    @IBOutlet weak var photosSearchBar: UISearchBar!
    let viewModel = AlbumDetailsViewModel(service: PhotosService(
        service: MoyaNetworkService(),
        albumId: 1
    ))
    var albumId: Int = 1
    var AlbumTitle: String = ""

    @IBOutlet weak var photosCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initSearch()
        navTitle()
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        bindPhotos()
        photosCollectionView.showLoadingOverlay()
        viewModel.getPhotosData(albumId: albumId)
    }

    func navTitle() {
        self.title = AlbumTitle
        self.navigationItem.largeTitleDisplayMode = .always
    }

    func initSearch() {
        photosSearchBar.delegate = self
        definesPresentationContext = true
    }

    func bindPhotos() {
        viewModel.bindPhotosToViewController = { [weak self] in
            DispatchQueue.main.async {
                self?.viewModel.resetFilteredPhotos()
                self?.photosCollectionView.hideLoadingOverlay()
                self?.photosCollectionView.reloadData()
            }
        }
    }
}
