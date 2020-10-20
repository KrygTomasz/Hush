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
}

final class StageRouter: BaseRouter<StageChannel> {
    override var routingViewController: UIViewController { return viewController }
    private var viewController: StageViewController!
    private var viewModel: StageViewModel!
    override init() {
        super.init()
        self.viewModel = StageViewModel()
        self.viewController = StageViewController(viewModel: viewModel)
    }
    
    override func handle(_ channel: StageChannel) {
        switch channel {
        case .back:
            routeBack()
        }
    }
}
