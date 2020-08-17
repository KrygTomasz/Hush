//
//  BoardSetupFactory.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

struct BoardSetupFactory {
    static func create(size: BoardSize) -> BoardSetup {
        var rows: [BoardRow] = []
        (0..<size.height).forEach { y in
            var items: [BoardItem] = []
            (0..<size.width).forEach { x in
                let position = BoardPosition(x: x, y: y)
                items.append(BoardItem(state: .off, position: position))
            }
            let row = BoardRow(items: items)
            rows.append(row)
        }
        return BoardSetup(rows: rows)
    }
}
