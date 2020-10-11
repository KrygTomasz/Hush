//
//  AppRouter.swift
//  Hush
//
//  Created by Tomasz Kryg on 11/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class AppRouter {
    static let navigationController: NavigationController = NavigationController()
    func start(window: UIWindow?) {
        window?.rootViewController = AppRouter.navigationController
        MenuRouter().route()
    }
}
