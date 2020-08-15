//
//  SpyBoardEngine.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

@testable import Hush

final class SpyBoardEngine: BoardEngine {
    var toggledX: Int?
    var toggledY: Int?
    var toggledSetup: BoardSetup?

    func toggle(x: Int, y: Int, setup: BoardSetup) {
        self.toggledX = x
        self.toggledY = y
        self.toggledSetup = setup
    }
}
