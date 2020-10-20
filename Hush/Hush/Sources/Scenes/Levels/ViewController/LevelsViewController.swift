//
//  LevelsViewController.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class LevelsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: LevelsViewModel
    var tableAdapter: LevelsTableViewAdapter = LevelsTableViewAdapter()

    // MARK: - Lifecycle
    
    init(viewModel: LevelsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: LevelsViewController.self), bundle: Bundle(for: LevelsViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableAdapter.setup(tableView: tableView, viewModel: viewModel)
    }

}
