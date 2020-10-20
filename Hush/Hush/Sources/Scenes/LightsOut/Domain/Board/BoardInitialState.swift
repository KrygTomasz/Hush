//
//  BoardInitialState.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

enum BoardInitialState {
    case random(Int)
    case fixed([BoardPosition])
}
