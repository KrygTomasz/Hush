//
//  Board.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import RxCocoa

final class Board {
    let setup: BoardSetup
    private let engine: BoardEngine
    
    init(setup: BoardSetup, engine: BoardEngine) {
        self.engine = engine
        self.setup = setup
    }
    
    func click(x: Int, y: Int) {
        engine.toggle(position: BoardPosition(x: x, y: y), setup: setup)
    }
    
    func hint() -> (x: Int, y: Int)? {
        guard let hint = engine.hint(for: setup) else { return nil }
        return (x: hint.x, y: hint.y)
    }
    
    var score: Driver<BoardScore> {
        return engine.score
    }
    
    var gameOver: Driver<Void> {
        return engine.gameOver
    }
}
