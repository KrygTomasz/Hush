//
//  BoardCellProvider.swift
//  Hush
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

enum BoardCellProvider: UICollectionViewCellProvider {
    case light
    
    var type: CollectionCell {
        switch self {
        case .light:
            return BoardCollectionViewCell.self
        }
    }
}
