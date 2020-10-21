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
    case winner
}

final class BoardRouter: BaseRouter<BoardChannel> {
    override var routingViewController: UIViewController { return viewController }
    private var viewController: BoardViewController!
    private var viewModel: BoardViewModel!
    private let color: Color = .random
    init(boardData: BoardData) {
        super.init()
        let board = BoardBuilder()
            .set(boardData: boardData)
            .set(engine: DefaultBoardEngine())
            .build()        
        self.viewModel = BoardViewModel(route: channel.accept, board: board, color: color)
        self.viewController = BoardViewController(viewModel: viewModel)
    }
    
    override func handle(_ channel: BoardChannel) {
        switch channel {
        case .back:
            routeBack()
        case .winner:
            showWinnerAlert()
        }
    }
    
    private func showWinnerAlert() {
        let alert = AlertBuilder()
            .set(title: "Great job!")
            .set(color: color)
            .set(firstButton: .init(text: "Continue", action: { [weak self] in self?.routeBack() }))
            .build()
        AlertPresenter().present(alert)
    }
}
