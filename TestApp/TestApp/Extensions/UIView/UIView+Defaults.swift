//
//  UIView+Defaults.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import UIKit

extension UIView {
    convenience init(cornerRadius: CGFloat) {
        self.init()
        self.layer.cornerRadius = cornerRadius
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }
}
