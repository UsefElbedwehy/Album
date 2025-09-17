//
//  ImageZoomViewController.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import UIKit
import SDWebImage

class ImageZoomViewController: UIViewController {
    @IBOutlet weak var imgZoomViewer: UIImageView!
    var imgUrl = ""
    var imageId = 0
    var albumId = 0
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpScroll()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        imgZoomViewer.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(systemName: "heart.fill"))
    }
    
    func setUpScroll(){
        scrollView.delegate = self
    }
    
    @objc func shareTapped() {
        guard let image = imgZoomViewer.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        let deepLink = URL(string: "album://image/\(imageId)?albumId=\(albumId)")!

        let vc = UIActivityViewController(activityItems: ["Check out this photo!", image, deepLink], applicationActivities: nil)
        
        if let popover = vc.popoverPresentationController {
            popover.barButtonItem = navigationItem.rightBarButtonItem
        }
        
        present(vc, animated: true)
    }
}

extension ImageZoomViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgZoomViewer
    }
}
