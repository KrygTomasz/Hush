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
        viewModel.output.stageData
            .drive(tableView.rx.items) { [weak self] (tableView, row, stageData) in
                guard let self = self else { return UITableViewCell() }
                return self.getCell(tableView: tableView, stageData: stageData, indexPath: IndexPath(row: row, section: 0))
            }
            .disposed(by: disposeBag)
    }
    
    private func getCell(tableView: UITableView, stageData: StageData, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StageCellProvider.stage.id, for: indexPath) as! StageTableViewCell
        cell.configure(with: stageData, didSelect: viewModel.input.levelSelected.accept)
        return cell
    }
    
    // MARK: - Delegates
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.width / 3
    }
    
}
