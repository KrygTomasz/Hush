//
//  BoardRouter.swift
//  Hush
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

enum BoardChannel: RouterChannel {
    case back
}

final class BoardRouter: BaseRouter<BoardChannel> {
    override var routingViewController: UIViewController { return viewController }
    private var viewController: BoardViewController!
    private var viewModel: BoardViewModel!
    
    override init() {
        super.init()
        let board = BoardBuilder()
            .set(size: .init(height: 4, width: 4))
            .set(engine: DefaultBoardEngine())
            .set(initialToggles: 2)
            .build()        
        self.viewModel = BoardViewModel(route: channel.accept, board: board)
        self.viewController = BoardViewController(viewModel: viewModel)
    }
    
    override func handle(_ channel: BoardChannel) {
        switch channel {
        case .back:
            routeBack()
        }
    }
}
