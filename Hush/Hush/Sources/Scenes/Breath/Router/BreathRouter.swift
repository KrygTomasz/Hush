//
//  BreathRouter.swift
//  Hush
//
//  Created by Tomasz Kryg on 11/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class BreathRouter: Router {
    var routingViewController: UIViewController { return viewController }
    private let viewController: BreathViewController
    private let viewModel: BreathViewModel
    init() {
        self.viewModel = BreathViewModel()
        self.viewController = BreathViewController(viewModel: viewModel)
    }
}
