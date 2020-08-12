//
//  UITableViewCellProvider.swift
//  Hush
//
//  Created by Tomasz Kryg on 12/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

typealias Cell = UITableViewCell.Type

protocol UITableViewCellProvider: CaseIterable {
    var type: Cell { get }
    var id: String { get }
}

extension UITableViewCellProvider {
    var id: String {
        return String.init(describing: type)
    }
}
