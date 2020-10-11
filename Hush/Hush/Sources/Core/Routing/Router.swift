//
//  Router.swift
//  Hush
//
//  Created by Tomasz Kryg on 11/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

protocol Router {
    var routingViewController: UIViewController { get }
}

extension Router {
    func route() {
        AppRouter.activeRouters.append(self)
        AppRouter.navigationController.pushViewController(routingViewController, animated: true)
    }
    
    func routeBack() {
        AppRouter.activeRouters.removeLast()
        AppRouter.navigationController.popViewController(animated: true)
    }
}
