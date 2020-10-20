//
//  StageViewController.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class StageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: StageViewModel
    let tableAdapter: StageTableViewAdapter = StageTableViewAdapter()

    // MARK: - Lifecycle
    
    init(viewModel: StageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: StageViewController.self), bundle: Bundle(for: StageViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewModel.output.color.primary
        setupTableView()
    }
    
    private func setupTableView() {
        tableAdapter.setup(tableView: tableView, viewModel: viewModel)
    }

}
