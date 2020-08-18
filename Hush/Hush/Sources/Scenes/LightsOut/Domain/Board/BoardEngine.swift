//
//  BoardEngine.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import RxCocoa

protocol BoardEngine {
    var score: Driver<BoardScore> { get }
    var gameOver: Driver<Void> { get }
    func toggle(position: BoardPosition, setup: BoardSetup)
    func hint(for setup: BoardSetup) -> BoardPosition?
}
