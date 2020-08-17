//
//  SpyBoardEngine.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

@testable import Hush

final class SpyBoardEngine: BoardEngine {
    var toggledPosition: BoardPosition?
    var toggledSetup: BoardSetup?

    func toggle(position: BoardPosition, setup: BoardSetup) {
        self.toggledPosition = position
        self.toggledSetup = setup
    }
    
    func hint(for setup: BoardSetup) -> BoardPosition? {
        return nil
    }
}
