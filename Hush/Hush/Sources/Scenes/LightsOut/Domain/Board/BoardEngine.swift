//
//  BoardEngine.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

protocol BoardEngine {
    func toggle(position: BoardPosition, setup: BoardSetup)
}
