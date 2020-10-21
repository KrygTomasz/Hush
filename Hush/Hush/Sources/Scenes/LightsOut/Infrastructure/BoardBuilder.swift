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
    var initialState: BoardInitialState = .fixed([])
    
    init() { }
    
    func set(engine: BoardEngine) -> BoardBuilder {
        self.engine = engine
        return self
    }
    
    func set(boardData: BoardData) -> BoardBuilder {
        self.size = boardData.size
        self.initialState = boardData.initialState
        return self
    }
    
    func build() -> Board {
        let setup = BoardSetupFactory.create(size: size)
        let board = Board(setup: setup, engine: engine)
        
        switch initialState {
        case .random(let number):
            let emptyFieldsShuffled: [BoardPosition] = (0..<size.width).flatMap { x in
                    (0..<size.height).map { y in
                        BoardPosition(x: x, y: y)
                    }
                }.shuffled()
            let togglesCount = min(number, emptyFieldsShuffled.count)
            (0..<togglesCount).forEach { index in
                let position = emptyFieldsShuffled[index]
                board.click(position: position)
            }
        case .fixed(let positions):
            positions.forEach { position in
                board.click(position: position)
            }
        }
        return board
    }
}
