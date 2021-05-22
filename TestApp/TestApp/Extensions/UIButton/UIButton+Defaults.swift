//
//  UIButton+Defaults.swift
//  TestApp
//
//  Created by Wojciech Kulas on 22/05/2021.
//

import UIKit

extension UIButton {
    func setImage(_ image: UIImage?) {
        setImage(image, for: .normal)
        setImage(image, for: .highlighted)
    }
}
