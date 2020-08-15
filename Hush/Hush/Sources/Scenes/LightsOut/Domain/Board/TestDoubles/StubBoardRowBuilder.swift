//
//  StubBoardRowBuilder.swift
//  HushTests
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

@testable import Hush

final class StubBoardSetupBuilder {
    private var stateGenerator: (Int) -> (LightState) = { _ in return Int.random(in: (0...1))%2 == 0 ? .off : .on }
    private var height: Int = 5
    private var width: Int = 5
    
    func set(stateGenerator: @escaping (Int) -> (LightState)) -> StubBoardSetupBuilder {
        self.stateGenerator = stateGenerator
        return self
    }
    
    func set(height: Int = 5, width: Int = 5) -> StubBoardSetupBuilder {
        self.height = height
        self.width = width
        return self
    }
    
    func build() -> BoardSetup {
        let rows = (0..<height).map { _ -> BoardRow in
            let items = (0..<width).map { BoardItem(state: stateGenerator($0)) }
            return BoardRow(items: items)
        }
        return BoardSetup(rows: rows)
    }
}
