//
//  BreathViewController.swift
//  Hush
//
//  Created by Tomasz Kryg on 11/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class BreathViewController: UIViewController {

    let viewModel: BreathViewModel
    
    init(viewModel: BreathViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: BreathViewController.self), bundle: Bundle(for: BreathViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
