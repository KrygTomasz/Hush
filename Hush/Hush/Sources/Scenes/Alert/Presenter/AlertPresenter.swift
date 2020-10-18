//
//  AlertPresenter.swift
//  Hush
//
//  Created by Tomasz Kryg on 18/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

class AlertPresenter {
    func present(_ alert: Alert) {
        let viewModel = AlertViewModel(alert: alert)
        let viewController = AlertViewController(viewModel: viewModel)
        viewController.modalPresentationStyle = .overFullScreen
        AppRouter.shared.present(viewController)
    }
}
