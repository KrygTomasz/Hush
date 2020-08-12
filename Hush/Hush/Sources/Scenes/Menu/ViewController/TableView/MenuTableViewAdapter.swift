//
//  MenuTableViewAdapter.swift
//  Hush
//
//  Created by Tomasz Kryg on 12/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class MenuTableViewAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var tableView: UITableView!
    weak var viewModel: MenuViewModel!
    
    init(tableView: UITableView, viewModel: MenuViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        tableView.register(cells: MenuCellProvider.self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCellProvider.button.id, for: indexPath) as! MenuTableViewCell
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.output.viewData.count
    }
}
