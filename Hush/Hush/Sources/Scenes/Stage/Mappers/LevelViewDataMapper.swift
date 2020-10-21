//
//  LevelViewDataMapper.swift
//  Hush
//
//  Created by Tomasz Kryg on 21/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

struct LevelViewDataMapper {
    static func map(_ data: LevelData) -> LevelViewData {
        return LevelViewData(title: "\(data.level)",
                      color: data.color,
                      passed: false)
    }
}
