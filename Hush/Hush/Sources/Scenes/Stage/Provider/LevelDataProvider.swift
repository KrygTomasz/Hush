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
        let modifier = stage - 1
        let boardData: [BoardData] = [.init(size: .init(height: 3 + modifier, width: 3 + modifier),
                                            initialState: .fixed([.init(x: 1, y: 1)])),
                                      .init(size: .init(height: 3 + modifier, width: 3 + modifier),
                                            initialState: .fixed([.init(x: 1, y: 0),
                                                                  .init(x: 0, y: 2)])),
                                      .init(size: .init(height: 3 + modifier, width: 3 + modifier),
                                            initialState: .fixed([.init(x: 0, y: 0),
                                                                  .init(x: 2, y: 2),
                                                                  .init(x: 2, y: 0),
                                                                  .init(x: 0, y: 2)])),
                                      .init(size: .init(height: 3 + modifier, width: 3 + modifier),
                                            initialState: .fixed([.init(x: 0, y: 0),
                                                                  .init(x: 1, y: 1),
                                                                  .init(x: 2, y: 2)])),
                                      .init(size: .init(height: 3 + modifier, width: 4 + modifier),
                                            initialState: .fixed([.init(x: 1, y: 1),
                                                                  .init(x: 3, y: 2),
                                                                  .init(x: 0, y: 1)]))
        ]
        return boardData.enumerated().map { LevelData.init(level: $0.offset + 1, board: $0.element, color: color) }
    }
}
