//
//  DefaultBoardEngine.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

class DefaultBoardEngine: BoardEngine {
    init() { }
    
    #warning("TODO: toggle should return updated indexes")
    func toggle(position: BoardPosition, setup: BoardSetup) {
        tryToggle(x: position.x, y: position.y, setup: setup)
        tryToggle(x: position.x-1, y: position.y, setup: setup)
        tryToggle(x: position.x, y: position.y+1, setup: setup)
        tryToggle(x: position.x+1, y: position.y, setup: setup)
        tryToggle(x: position.x, y: position.y-1, setup: setup)
        setup.solution.update(position: position)
    }
    
    func hint(for setup: BoardSetup) -> BoardPosition? {
        return setup.solution.getHint()
    }
    
    private func tryToggle(x: Int, y: Int, setup: BoardSetup) {
        guard let state = setup.getState(x: x, y: y) else { return }
        let newState = LightStateReducer.reduce(state: state)
        setup.set(state: newState, x: x, y: y)
    }
    
}
