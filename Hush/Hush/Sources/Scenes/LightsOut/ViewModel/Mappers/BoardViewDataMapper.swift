//
//  BoardViewDataMapper.swift
//  Hush
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

struct BoardViewDataMapper {
    static func map(setup: BoardSetup) -> [[BoardViewData]] {
        return setup.rows.map { row -> [BoardViewData] in
            return row.items.map { item -> BoardViewData in
                map(state: item.state)
            }
        }
    }
    
    static func map(state: LightState) -> BoardViewData {
        switch state {
        case .off: return BoardViewData(color: .black)
        case .on: return BoardViewData(color: .yellow)
        }
    }
}
