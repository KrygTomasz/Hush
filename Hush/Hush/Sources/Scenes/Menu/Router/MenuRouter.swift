//
//  MenuRouter.swift
//  Hush
//
//  Created by Tomasz Kryg on 12/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

enum MenuChannel: RouterChannel {
    case board
}

final class MenuRouter: BaseRouter<MenuChannel> {
    override var routingViewController: UIViewController { return viewController }
    private var viewModel: MenuViewModel!
    private var viewController: MenuViewController!
    
    override init() {
        super.init()
        self.viewModel = MenuViewModel(route: channel.accept)
        self.viewController = MenuViewController(viewModel: viewModel)
    }
    
    override func handle(_ channel: MenuChannel) {
        switch channel {
        case .board:
            routeToBoard()
        }
    }
    
    private func routeToBoard() {
        BoardRouter().route()
    }
}
