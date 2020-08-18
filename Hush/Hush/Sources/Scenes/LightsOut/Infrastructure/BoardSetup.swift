//
//  BoardSetup.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

final class BoardSetup {
    private(set) var rows: [BoardRow]
    var solution: BoardSolution
    
    init(rows: [BoardRow]) {
        self.rows = rows
        self.solution = BoardSolution()
    }
    
    func set(state: LightState, x: Int, y: Int) {
        guard let _ = rows[safe: y]?.items[safe: x] else { return }
        rows[y].items[x].state = state
    }
    
    func getState(x: Int, y: Int) -> LightState? {
        return rows[safe: y]?.items[safe: x]?.state
    }
}
