//
//  StageViewModel.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class StageViewModel {
    
    struct Input {
        let backTrigger: PublishRelay<Void> = PublishRelay()
        let levelSelected: PublishRelay<BoardData> = PublishRelay()
    }
    
    struct Output {
        let color: Color
        let stageData: Driver<[StageData]>
    }
    
    private let disposeBag: DisposeBag = DisposeBag()
    let input: Input = Input()
    let output: Output
    
    init(route: @escaping (StageChannel) -> Void) {
        let color: Color = .random
        let levelDataProvider: (Int) -> [LevelData] = { stage in LevelDataProvider().provide(stage: stage, color: color) }
        let stageData: [StageData] = (1...10).map { .init(color: color, levels: levelDataProvider($0)) }
        output = .init(color: color,
                       stageData: .just(stageData))
        bind(route: route)
    }
    
    private func bind(route: @escaping (StageChannel) -> Void) {
        input.levelSelected
            .asSignal()
            .emit(onNext: { boardData in
                route(.board(boardData))
            })
            .disposed(by: disposeBag)
        
        input.backTrigger
            .asSignal()
            .emit(onNext: { _ in
                route(.back)
            })
            .disposed(by: disposeBag)
    }
}
