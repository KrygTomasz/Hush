//
//  LevelCellProvider.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

enum LevelCellProvider: UICollectionViewCellProvider {
    case level
    
    var type: CollectionCell {
        switch self {
        case .level:
            return LevelCollectionViewCell.self
        }
    }
}
