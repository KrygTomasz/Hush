//
//  BoardViewModel.swift
//  Hush
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

final class BoardViewModel {
    init() {
        prepareBoard()
    }
    
    private func prepareBoard() {
        let board = BoardBuilder()
            .set(size: .init(height: 6, width: 6))
            .set(engine: DefaultBoardEngine())
            .set(initialToggles: 3)
            .build()
        board.log()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            board.click(x: 1, y: 1)
            board.log()
        }
    }
}
