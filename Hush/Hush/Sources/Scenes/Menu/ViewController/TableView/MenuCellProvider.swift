//
//  MenuCellProvider.swift
//  Hush
//
//  Created by Tomasz Kryg on 12/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

enum MenuCellProvider: UICollectionViewCellProvider {
    case button
    
    var type: CollectionCell {
        switch self {
        case .button:
            return MenuCollectionViewCell.self
        }
    }
}
