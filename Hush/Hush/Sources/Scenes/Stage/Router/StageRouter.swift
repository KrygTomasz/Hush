//
//  StageRouter.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

enum StageChannel: RouterChannel {
    case back
    case board
}

final class StageRouter: BaseRouter<StageChannel> {
    override var routingViewController: UIViewController { return viewController }
    private var viewController: StageViewController!
    private var viewModel: StageViewModel!
    override init() {
        super.init()
        self.viewModel = StageViewModel(route: channel.accept)
        self.viewController = StageViewController(viewModel: viewModel)
    }
    
    override func handle(_ channel: StageChannel) {
        switch channel {
        case .back:
            routeBack()
        case .board:
            BoardRouter().route()
        }
    }
}
