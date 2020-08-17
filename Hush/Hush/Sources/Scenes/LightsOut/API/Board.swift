//
//  Board.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

class Board {
    let setup: BoardSetup
    private let engine: BoardEngine
    
    init(setup: BoardSetup, engine: BoardEngine) {
        self.engine = engine
        self.setup = setup
    }
    
    func click(x: Int, y: Int) {
        engine.toggle(position: BoardPosition(x: x, y: y), setup: setup)
    }
    
    func log() {
        setup.log()
    }
}
