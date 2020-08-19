//
//  SpyBoardEngine.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import RxCocoa

@testable import Hush

final class SpyBoardEngine: BoardEngine {
    var score: Driver<BoardScore> = .empty()
    var gameOver: Driver<Void> = .empty()
    private(set) var toggledPosition: BoardPosition?
    private(set) var toggledSetup: BoardSetup?
    private(set) var hintedSetup: BoardSetup?

    func toggle(position: BoardPosition, setup: BoardSetup) {
        self.toggledPosition = position
        self.toggledSetup = setup
    }
    
    func hint(for setup: BoardSetup) -> BoardPosition? {
        self.hintedSetup = setup
        return nil
    }
}
