//
//  BoardRouter.swift
//  Hush
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class BoardRouter: Router {
    var routingViewController: UIViewController { return viewController }
    private let viewController: BoardViewController
    private let viewModel: BoardViewModel
    
    init() {
        let board = BoardBuilder()
            .set(size: .init(height: 3, width: 4))
            .set(engine: DefaultBoardEngine())
            .set(initialToggles: 1)
            .build()
        board.log()
        
        self.viewModel = BoardViewModel(board: board)
        self.viewController = BoardViewController(viewModel: viewModel)
    }
}
