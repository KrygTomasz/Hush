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
    func toggle(x: Int, y: Int, setup: BoardSetup) {
        tryToggle(x: x, y: y, setup: setup)
        tryToggle(x: x-1, y: y, setup: setup)
        tryToggle(x: x, y: y+1, setup: setup)
        tryToggle(x: x+1, y: y, setup: setup)
        tryToggle(x: x, y: y-1, setup: setup)
    }
    
    private func tryToggle(x: Int, y: Int, setup: BoardSetup) {
        guard let state = setup.getState(x: x, y: y) else { return }
        let newState = LightStateReducer.reduce(state: state)
        setup.set(state: newState, x: x, y: y)
    }
    
}
