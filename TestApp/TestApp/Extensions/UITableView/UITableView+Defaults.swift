//
//  UITableView+Defaults.swift
//  TestApp
//
//  Created by Wojciech Kulas on 21/05/2021.
//

import UIKit

extension UITableView {
    convenience init(tableViewCells: [UITableViewCell.Type]) {
        self.init()
        backgroundColor = .clear
        separatorStyle = .none
        tableViewCells.forEach {
            self.register($0, forCellReuseIdentifier: String(describing: $0))
        }
    }
}
