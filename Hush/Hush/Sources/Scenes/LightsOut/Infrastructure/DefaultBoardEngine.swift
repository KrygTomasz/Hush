//
//  DefaultBoardEngine.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import RxSwift
import RxCocoa

final class DefaultBoardEngine: BoardEngine {
    
    private let updateScore: BehaviorRelay<Void> = BehaviorRelay(value: ())
    private let noHints: PublishRelay<Void> = PublishRelay()
    var score: Driver<BoardScore> {
        return updateScore
            .asDriver(onErrorJustReturn: ())
            .scan(-1) { (value, _) in value + 1 }
            .map { BoardScore(value: $0) }
    }
    var gameOver: Driver<Void> {
        return noHints
            .asDriver(onErrorJustReturn: ())
    }
    
    init() { }
    
    // TODO: toggle may return updated indexes?
    func toggle(position: BoardPosition, setup: BoardSetup) {
        if !setup.contains(position) { return }
        updateScore.accept(())
        tryToggle(x: position.x, y: position.y, setup: setup)
        tryToggle(x: position.x-1, y: position.y, setup: setup)
        tryToggle(x: position.x, y: position.y+1, setup: setup)
        tryToggle(x: position.x+1, y: position.y, setup: setup)
        tryToggle(x: position.x, y: position.y-1, setup: setup)
        setup.solution.update(position: position)
        checkGameOver(setup: setup)
    }
    
    func hint(for setup: BoardSetup) -> BoardPosition? {
        return setup.solution.getHint()
    }
    
    // MARK: – Helpers
    
    private func tryToggle(x: Int, y: Int, setup: BoardSetup) {
        guard let state = setup.getState(x: x, y: y) else { return }
        let newState = LightStateReducer.reduce(state: state)
        setup.set(state: newState, x: x, y: y)
    }
    
    private func checkGameOver(setup: BoardSetup) {
        if hint(for: setup) == nil { noHints.accept(()) }
    }
}
