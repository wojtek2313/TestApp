//
//  DescriptionCellType.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import Foundation
import UIKit

enum DescrptionCellType {
    case gitHub
    case bitbucket
    
    var backgroundColor: UIColor {
        switch self {
        case .gitHub:
            return .plantation
        case .bitbucket:
            return .shamrock
        }
    }
}
