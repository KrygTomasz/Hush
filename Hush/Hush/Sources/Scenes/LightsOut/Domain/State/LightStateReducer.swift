//
//  LightStateReducer.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

struct LightStateReducer {
    static func reduce(state: LightState) -> LightState {
        switch state {
        case .on:
            return .off
        case .off:
            return .on
        }
    }
}
