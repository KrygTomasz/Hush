//
//  AlertViewController.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class AlertViewController: UIViewController {

    @IBOutlet private weak var alertView: AlertView!
    let viewModel: AlertViewModel
    
    // MARK: - Lifecycle
    
    init(viewModel: AlertViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: AlertViewController.self), bundle: Bundle(for: AlertViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.configure(with: viewModel.alert)
    }

}
