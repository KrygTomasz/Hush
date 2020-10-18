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
        var backTrigger: Signal<Void>
    }
    
    struct Output {
        var reload: Driver<[IndexPath]>
        var hint: Driver<IndexPath>
        var score: Driver<BoardScore>
        var color: Driver<Color>
        var viewData: [[BoardViewData]]
        var sectionsCount: Int { viewData.count }
        var rowsCount: Int { viewData.first?.count ?? 0 }
    }
    
    // MARK: - Properties
    
    private let disposeBag: DisposeBag = DisposeBag()
    private let route: (BoardChannel) -> Void
    private let board: Board
    private let color: Color
    var output: Output!
    
    // MARK: - Lifecycle
    
    init(route: @escaping (BoardChannel) -> Void,
         board: Board,
         color: Color) {
        self.route = route
        self.board = board
        self.color = color
    }
    
    func transform(input: Input) {
        input.backTrigger
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] (_) in
                self?.route(.back)
            })
            .disposed(by: disposeBag)
        
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
        
        board.gameOver
            .drive(onNext: { [weak self] (_) in
                self?.route(.winner)
            }).disposed(by: disposeBag)

        
        let score = board.score
        let color = Driver.just(self.color)
        
        self.output = .init(reload: reload,
                            hint: hint,
                            score: score,
                            color: color,
                            viewData: BoardViewDataMapper.map(setup: board.setup, baseColor: self.color))
    }
    
    // MARK: – Helpers
    
    private func click(at indexPath: IndexPath) {
        board.click(x: indexPath.item, y: indexPath.section)
        allIndexPaths().forEach { indexPath in
            guard let state = board.setup.getState(x: indexPath.item, y: indexPath.section) else { return }
            let viewData = BoardViewDataMapper.map(state: state, baseColor: self.color)
            output.viewData[indexPath.section][indexPath.item] = viewData
        }
    }
    
    private func allIndexPaths() -> [IndexPath] {
        return (0..<output.sectionsCount).flatMap { section in
            (0..<output.rowsCount).map { item -> IndexPath in
                return IndexPath(item: item, section: section)
            }
        }
    }
}
