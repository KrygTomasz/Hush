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
    
    func click(position: BoardPosition) {
        engine.toggle(position: position, setup: setup)
    }
    
    func hint() -> BoardPosition? {
        return engine.hint(for: setup)
    }
    
    var score: Driver<BoardScore> {
        return engine.score
    }
    
    var gameOver: Driver<Void> {
        return engine.gameOver
    }
}
