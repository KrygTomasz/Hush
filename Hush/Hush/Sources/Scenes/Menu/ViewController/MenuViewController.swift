//
//  MenuViewController.swift
//  Hush
//
//  Created by Tomasz Kryg on 12/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class MenuViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    let viewModel: MenuViewModel
    var tableAdapter: MenuTableViewAdapter!
    
    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
        viewModel.transform(input: .init())
        super.init(nibName: String(describing: MenuViewController.self), bundle: Bundle(for: MenuViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    private func setupView() {
        view.backgroundColor = .blue
    }
    
    private func setupTableView() {
        self.tableAdapter = MenuTableViewAdapter(tableView: tableView, viewModel: viewModel)
        self.tableView.delegate = tableAdapter
        self.tableView.dataSource = tableAdapter
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
    
}
