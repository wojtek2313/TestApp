//
//  UILabel+Defaults.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import UIKit

extension UILabel {
    convenience init (text: String? = "", textColor: UIColor, size: CGFloat, weight: UIFont.Weight, numberOfLines: Int = 0, textAlignment: NSTextAlignment = .left) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }
}
