//
//  BoardTests.swift
//  HushTests
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import XCTest
@testable import Hush

final class BoardTests: XCTestCase {
    var setup: BoardSetup!
    var engine: SpyBoardEngine!
    var sut: Board!
    
    override func setUp() {
        prepareSut()
    }
    
    func test_boardFieldClicked_EngineActionIsLaunched() {
        assertSpyEngineEmpty()
        sut.click(x: 1, y: 1)
        let position = BoardPosition(x: 1, y: 1)
        XCTAssertEqual(engine.toggledPosition, position)
        XCTAssertEqual(engine.toggledSetup != nil, true)
    }
    
    private func prepareSut() {
        setup = BoardSetupFactory.create(size: .init(height: 4, width: 4))
        engine = SpyBoardEngine()
        sut = Board(setup: setup, engine: engine)
    }
    
    private func assertSpyEngineEmpty() {
        XCTAssertEqual(engine.toggledPosition, nil)
        XCTAssertEqual(engine.toggledSetup == nil, true)
    }
}
