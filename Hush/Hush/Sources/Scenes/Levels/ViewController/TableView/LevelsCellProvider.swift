//
//  LevelsCellProvider.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

enum LevelsCellProvider: UITableViewCellProvider {
    case levels
    
    var type: TableCell {
        switch self {
        case .levels:
            return LevelsTableViewCell.self
        }
    }
}
