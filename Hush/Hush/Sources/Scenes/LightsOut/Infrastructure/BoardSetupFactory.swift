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
        (0..<size.height).forEach { h in
            var items: [BoardItem] = []
            (0..<size.width).forEach { w in
                items.append(BoardItem(state: .off))
            }
            let row = BoardRow(items: items)
            rows.append(row)
        }
        return BoardSetup(rows: rows)
    }
}
