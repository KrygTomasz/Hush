//
//  StageCellProvider.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

enum StageCellProvider: UITableViewCellProvider {
    case stage
    
    var type: TableCell {
        switch self {
        case .stage:
            return StageTableViewCell.self
        }
    }
}
