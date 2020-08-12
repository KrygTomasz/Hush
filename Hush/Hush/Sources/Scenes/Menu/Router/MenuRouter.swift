//
//  MenuRouter.swift
//  Hush
//
//  Created by Tomasz Kryg on 12/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class MenuRouter: Router {
    var routingViewController: UIViewController { return viewController }
    private let viewModel: MenuViewModel
    private let viewController: MenuViewController
    
    init() {
        self.viewModel = MenuViewModel()
        self.viewController = MenuViewController(viewModel: viewModel)
    }
}
