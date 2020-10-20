//
//  BoardPosition+IndexPath.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

extension BoardPosition {
    init(indexPath: IndexPath) {
        x = indexPath.item
        y = indexPath.section
    }
}
