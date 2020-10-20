//
//  StageViewModel.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import RxCocoa

final class StageViewModel {
    struct Output {
        let color: Color
        let viewData: Driver<[StageViewData]>
    }
    
    let output: Output
    
    init() {
        let color: Color = .random
        let levelViewData: [LevelViewData] = [.init(title: "1", color: color, passed: false),
                                              .init(title: "2", color: color, passed: false),
                                              .init(title: "3", color: color, passed: false),
                                              .init(title: "4", color: color, passed: false),
                                              .init(title: "5", color: color, passed: false),
                                              .init(title: "6", color: color, passed: false),
                                              .init(title: "7", color: color, passed: false),
                                              .init(title: "8", color: color, passed: false),
                                              .init(title: "9", color: color, passed: false),
                                              .init(title: "10", color: color, passed: false)
        ]
        let stageViewData: [StageViewData] = [.init(levels: levelViewData),
                                              .init(levels: levelViewData),
                                              .init(levels: levelViewData),
                                              .init(levels: levelViewData),
                                              .init(levels: levelViewData),
                                              .init(levels: levelViewData),
                                              .init(levels: levelViewData)
        ]
        output = .init(color: color,
                       viewData: .just(stageViewData))
    }
}
