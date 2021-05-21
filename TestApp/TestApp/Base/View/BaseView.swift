//
//  BaseView.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import UIKit

// MARK: - Class

class BaseView: UIView {
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgorundColor()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setBackgorundColor() {
        backgroundColor = .ebonyClay
    }
}
