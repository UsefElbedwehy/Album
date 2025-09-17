//
//  ProfileViewController.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var albumsTableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    let viewModel = ProfileViewModel(
        userService: UserService(
            service: MoyaNetworkService(),
            userRandomId: 1
        ),
        albumsService: AlbumsService(
            service: MoyaNetworkService(),
            userRandomId: 1
        )
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        albumsTableView.delegate = self
        albumsTableView.dataSource = self
        bindUser()
        bindAlbums()
        albumsTableView.showLoadingOverlay()
        viewModel.getUser()
        viewModel.getAlbums()
    }

    func bindUser() {
        viewModel.bindUserToViewController = { [weak self] in
            DispatchQueue.main.async {
                self?.nameLabel.text = self?.viewModel.userFinalResult?.name
                self?.emailLabel.text = self?.viewModel.userFinalResult?.email
                self?.albumsTableView.reloadData()
            }
        }
    }

    func bindAlbums() {
        viewModel.bindAlbumsToViewController = { () in
            DispatchQueue.main.async { [weak self] in
                self?.albumsTableView.hideLoadingOverlay()
                self?.albumsTableView.reloadData()
            }
        }
    }
}
