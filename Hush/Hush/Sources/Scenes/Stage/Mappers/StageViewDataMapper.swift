//
//  StageViewDataMapper.swift
//  Hush
//
//  Created by Tomasz Kryg on 21/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

struct StageViewDataMapper {
    static func map(_ data: StageData) -> StageViewData {
        return StageViewData(color: data.color, levels: data.levels.map(LevelViewDataMapper.map))
    }
}
