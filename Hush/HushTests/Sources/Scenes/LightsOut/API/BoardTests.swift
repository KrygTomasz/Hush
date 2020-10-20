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
    
    func test_boardFieldClicked_engineActionIsLaunched() {
        assertSpyEngineEmpty()
        let position = BoardPosition(x: 1, y: 2)
        sut.click(position: position)
        XCTAssertEqual(engine.toggledPosition, position)
        XCTAssertTrue(engine.toggledSetup != nil)
        XCTAssertTrue(engine.hintedSetup == nil)
    }
    
    func test_boardHinted_engineHintIsLaunched() {
        assertSpyEngineEmpty()
        let _ = sut.hint()
        XCTAssertEqual(engine.toggledPosition, nil)
        XCTAssertTrue(engine.toggledSetup == nil)
        XCTAssertTrue(engine.hintedSetup != nil)
    }
    
    private func prepareSut() {
        setup = BoardSetupFactory.create(size: .init(height: 4, width: 4))
        engine = SpyBoardEngine()
        sut = Board(setup: setup, engine: engine)
    }
    
    private func assertSpyEngineEmpty() {
        XCTAssertEqual(engine.toggledPosition, nil)
        XCTAssertTrue(engine.toggledSetup == nil)
        XCTAssertTrue(engine.hintedSetup == nil)
    }
}
