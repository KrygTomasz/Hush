//
//  BoardViewController.swift
//  Hush
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class BoardViewController: UIViewController {

    let viewModel: BoardViewModel
    
    init(viewModel: BoardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: BoardViewController.self), bundle: Bundle(for: BoardViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
