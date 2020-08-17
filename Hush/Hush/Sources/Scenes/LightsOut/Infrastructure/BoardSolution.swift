//
//  BoardSolution.swift
//  Hush
//
//  Created by Tomasz Kryg on 17/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

final class BoardSolution {
    private var positions: [BoardPosition]
    init() {
        self.positions = []
    }
    
    func update(position: BoardPosition) {
        positions.contains(position) ? positions.removeAll(where: { $0 == position }) : positions.append(position)
    }
    
    func getHint() -> BoardPosition? {
        return positions.last
    }
}
