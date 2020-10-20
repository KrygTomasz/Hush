//
//  LevelsRouter.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

enum LevelsChannel: RouterChannel {
    case back
}

final class LevelsRouter: BaseRouter<LevelsChannel> {
    override var routingViewController: UIViewController { return viewController }
    private var viewController: LevelsViewController!
    private var viewModel: LevelsViewModel!
    override init() {
        super.init()
        self.viewModel = LevelsViewModel()
        self.viewController = LevelsViewController(viewModel: viewModel)
    }
    
    override func handle(_ channel: LevelsChannel) {
        switch channel {
        case .back:
            routeBack()
        }
    }
}
