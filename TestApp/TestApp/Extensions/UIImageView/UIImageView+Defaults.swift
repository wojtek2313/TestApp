//
//  UIImageView+Defaults.swift
//  TestApp
//
//  Created by Wojciech Kulas on 22/05/2021.
//

import UIKit
import Nuke

extension UIImageView {
    func download(imageUrl: String) {
        let placeholder = UIImage(systemName: "person.crop.circle")
        guard let url = URL(string: imageUrl) else { return updateImage(placeholder) }
        let urlRequest = URLRequest(url: url)
        Nuke.loadImage(with: urlRequest, into: self) { data in
            switch data {
            case .failure:
                self.updateImage(placeholder)
            case .success:
                break
            }
        }
    }
    
    private func updateImage(_ image: UIImage?) {
        self.image = image
        contentMode = .scaleAspectFit
    }
}
