//
//  LevelDataProvider.swift
//  Hush
//
//  Created by Tomasz Kryg on 21/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

struct LevelDataProvider {
    func provide(stage: Int, color: Color) -> [LevelData] {
        let stageModifier = stage - 1
        let boardData = (0...9).map { level in
            return BoardData(size: .init(height: 3 + stageModifier, width: 3 + level),
                             initialState: .random(Int(stage+level) * 3/4 + 1))
        }
        return boardData.enumerated().map { LevelData.init(level: $0.offset + 1, board: $0.element, color: color) }
    }
}
