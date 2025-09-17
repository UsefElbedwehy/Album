//
//  UIView+Ext.swift
//  Album
//
//  Created by Usef on 17/09/2025.
//

import UIKit

extension UIView {
    func showLoadingOverlay() {
        let overlay = UIView(frame: bounds)
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        overlay.tag = 999

        let spinner = UIActivityIndicatorView(style: .large)
        spinner.center = overlay.center
        spinner.startAnimating()

        overlay.addSubview(spinner)
        addSubview(overlay)
    }

    func hideLoadingOverlay() {
        viewWithTag(999)?.removeFromSuperview()
    }
}
