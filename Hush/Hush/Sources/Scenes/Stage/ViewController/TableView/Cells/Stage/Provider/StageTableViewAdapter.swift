//
//  StageTableViewAdapter.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class StageTableViewAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    
    weak var viewModel: StageViewModel!
    
    // MARK: - Setup
    
    func setup(tableView: UITableView, viewModel: StageViewModel) {
        self.viewModel = viewModel
        tableView.register(cells: StageCellProvider.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    // MARK: - Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StageCellProvider.stage.id, for: indexPath) as? StageTableViewCell else { return UITableViewCell() }
        cell.configure(color: viewModel.output.color)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.width / 3
    }
    
}
