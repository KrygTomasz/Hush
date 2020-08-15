//
//  BoardBuilder.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

class BoardBuilder {
    var size: BoardSize = BoardSize(height: 0, width: 0)
    var engine: BoardEngine = DefaultBoardEngine()
    var initialToggles: Int = 0
    
    init() { }
    
    func set(size: BoardSize) -> BoardBuilder {
        self.size = size
        return self
    }
    
    func set(engine: BoardEngine) -> BoardBuilder {
        self.engine = engine
        return self
    }
    
    func set(initialToggles: Int) -> BoardBuilder {
        self.initialToggles = initialToggles
        return self
    }
    
    func build() -> Board {
        let setup = BoardSetupFactory.create(size: size)
        let board = Board(setup: setup, engine: engine)
        (0..<initialToggles).forEach { _ in
            let x = Int.random(in: (0..<size.width))
            let y = Int.random(in: (0..<size.height))
            board.click(x: x, y: y)
        }
        return board
    }
}
