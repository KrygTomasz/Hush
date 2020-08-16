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
        self.viewModel = BoardViewModel()
        self.viewController = BoardViewController(viewModel: viewModel)
    }
}
