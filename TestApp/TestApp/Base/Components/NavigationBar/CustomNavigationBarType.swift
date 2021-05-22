//
//  CustomNavigationBarType.swift
//  AppZumiTest
//
//  Created by Wojciech Kulas on 20/05/2021.
//

import UIKit

enum CustomNavigationBarType {
    case repositories
    case details
    
    var title: String {
        switch self {
        case .repositories:
            return "Repositories"
        case .details:
            return "Details"
        }
    }
    
    var leftButtonIcon: UIImage? {
        switch self {
        case .repositories:
            let configuration = UIImage.SymbolConfiguration(pointSize: 24)
            return UIImage(systemName: "arrow.up.arrow.down.circle.fill", withConfiguration: configuration)
        case .details:
            let configuration = UIImage.SymbolConfiguration(pointSize: 24)
            return UIImage(systemName: "chevron.backward", withConfiguration: configuration)
        }
    }
}
