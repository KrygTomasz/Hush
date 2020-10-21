//
//  StageTableViewAdapter.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class StageTableViewAdapter: NSObject, UITableViewDelegate {
    
    // MARK: - Properties
    
    private let disposeBag: DisposeBag = DisposeBag()
    weak var viewModel: StageViewModel!
    
    // MARK: - Setup
    
    func setup(tableView: UITableView, viewModel: StageViewModel) {
        self.viewModel = viewModel
        tableView.register(cells: StageCellProvider.self)
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        bind(tableView: tableView)
    }
    
    private func bind(tableView: UITableView) {
        viewModel.output.viewData
            .drive(tableView.rx.items) { [weak self] (tableView, row, viewData) in
                guard let self = self else { return UITableViewCell() }
                return self.getCell(tableView: tableView, viewData: viewData, indexPath: IndexPath(row: row, section: 0))
            }
            .disposed(by: disposeBag)
    }
    
    private func getCell(tableView: UITableView, viewData: StageViewData, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StageCellProvider.stage.id, for: indexPath) as! StageTableViewCell
        cell.configure(viewData: viewData, didSelect: viewModel.input.itemSelected.accept)
        return cell
    }
    
    // MARK: - Delegates
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.width / 3
    }
    
}
