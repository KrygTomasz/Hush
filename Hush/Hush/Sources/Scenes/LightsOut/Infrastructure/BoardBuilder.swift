//
//  BoardBuilder.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

final class BoardBuilder {
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
        let emptyFieldsShuffled: [BoardPosition] = (0..<size.width).flatMap { x in
                (0..<size.height).map { y in
                    BoardPosition(x: x, y: y)
                }
            }.shuffled()
        let togglesCount = min(initialToggles, emptyFieldsShuffled.count)
        (0..<togglesCount).forEach { index in
            let position = emptyFieldsShuffled[index]
            board.click(x: position.x, y: position.y)
        }
        return board
    }
}
