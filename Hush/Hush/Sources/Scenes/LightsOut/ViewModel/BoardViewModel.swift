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
        var lightTrigger: Signal<IndexPath>
        var hintTrigger: Signal<Void>
    }
    
    struct Output {
        var reload: Driver<[IndexPath]>
        var hint: Driver<IndexPath>
        var score: Driver<BoardScore>
        var gameOver: Driver<Void>
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
        let reload = input.lightTrigger
            .asObservable()
            .do(onNext: { [weak self] indexPath in
                self?.click(at: indexPath)
            })
            .map { [weak self] _ in return self?.allIndexPaths() ?? [] }
            .asDriver(onErrorJustReturn: [])
        
        let hint = input.hintTrigger
            .flatMap { [weak self] _ -> Signal<IndexPath> in
                guard let position = self?.board.hint() else { return .empty() }
                let indexPath = IndexPath(item: position.x, section: position.y)
                return Signal.just(indexPath)
            }
            .asDriver(onErrorJustReturn: .init())
        
        let gameOver = board.gameOver
        let score = board.score
            
        self.output = .init(reload: reload,
                            hint: hint,
                            score: score,
                            gameOver: gameOver,
                            viewData: BoardViewDataMapper.map(setup: board.setup))
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
