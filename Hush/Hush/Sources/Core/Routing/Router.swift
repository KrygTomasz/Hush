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
    func route()
}

extension Router {
    func route() {
        AppRouter.navigationController.pushViewController(routingViewController, animated: true)
    }
    
    func routeBack() {
        AppRouter.navigationController.popViewController(animated: true)
    }
}
