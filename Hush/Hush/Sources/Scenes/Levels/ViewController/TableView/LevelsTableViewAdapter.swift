//
//  LevelsTableViewAdapter.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class LevelsTableViewAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    
    weak var viewModel: LevelsViewModel!
    
    // MARK: - Setup
    
    func setup(tableView: UITableView, viewModel: LevelsViewModel) {
        self.viewModel = viewModel
        tableView.register(cells: LevelsCellProvider.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LevelsCellProvider.levels.id, for: indexPath) as? LevelsTableViewCell else { return UITableViewCell() }
        return cell
    }
    
}
