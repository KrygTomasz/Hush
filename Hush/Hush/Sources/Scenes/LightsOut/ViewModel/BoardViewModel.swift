//
//  BoardViewModel.swift
//  Hush
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class BoardViewModel {
    
    // MARK: - Input and Output
    
    struct Input {
        var click: Signal<IndexPath>
    }
    
    struct Output {
        var reload: Driver<[IndexPath]>
        var viewData: [[BoardViewData]]
        var sectionsCount: Int { viewData.count }
        var rowsCount: Int { viewData.first?.count ?? 0 }
    }
    
    // MARK: - Properties
    
    private let board: Board
    var output: Output!
    
    // MARK: - Lifecycle
    
    init(board: Board) {
        self.board = board
    }
    
    func transform(input: Input) {
        let reload = input.click
            .asObservable()
            .do(onNext: { [weak self] indexPath in
                self?.click(at: indexPath)
            })
            .map { [weak self] _ in return self?.allIndexPaths() ?? [] }
            .asDriver(onErrorJustReturn: [])
            
        self.output = .init(reload: reload, viewData: BoardViewDataMapper.map(setup: board.setup))
    }
    
    // MARK: – Helpers
    
    private func click(at indexPath: IndexPath) {
        board.click(x: indexPath.item, y: indexPath.section)
        allIndexPaths().forEach { indexPath in
            guard let state = board.setup.getState(x: indexPath.item, y: indexPath.section) else { return }
            let viewData = BoardViewDataMapper.map(state: state)
            output.viewData[indexPath.section][indexPath.item] = viewData
        }
    }
    
    private func allIndexPaths() -> [IndexPath] {
        var allIndexPaths: [IndexPath] = []
        (0..<output.sectionsCount).forEach { section in
            let paths = (0..<output.rowsCount).map { item -> IndexPath in
                return IndexPath(item: item, section: section)
            }
            allIndexPaths.append(contentsOf: paths)
        }
        return allIndexPaths
    }
}
