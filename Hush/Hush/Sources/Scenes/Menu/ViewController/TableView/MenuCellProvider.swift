//
//  MenuCellProvider.swift
//  Hush
//
//  Created by Tomasz Kryg on 12/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

enum MenuCellProvider: UITableViewCellProvider {
    case button
    
    var type: TableCell {
        switch self {
        case .button:
            return MenuTableViewCell.self
        }
    }
}
