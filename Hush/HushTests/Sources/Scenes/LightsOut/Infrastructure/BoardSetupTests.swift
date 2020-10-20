//
//  BoardSetupTests.swift
//  HushTests
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import XCTest
@testable import Hush

final class BoardSetupTests: XCTestCase {
    
    var sut: BoardSetup!
    
    func test_setOnState_setsAndReturnsOnState() {
        prepareSut(count: 5)
        sut.set(state: .on, x: 0, y: 0)
        XCTAssertEqual(sut.getState(x: 0, y: 0), .on)
    }
    
    func test_setOffState_setsAndReturnsOffState() {
        prepareSut(count: 4)
        sut.set(state: .off, x: 1, y: 1)
        XCTAssertEqual(sut.getState(x: 1, y: 1), .off)
    }
    
    func test_getNotExistingState_returnsNil() {
        prepareSut(count: 3)
        XCTAssertEqual(sut.getState(x: 3, y: 3), nil)
    }
    
    func test_setup_shouldContainOnlyExistingPositions() {
        prepareSut(count: 6)
        let topLeft = BoardPosition(x: 0, y: 0)
        let bottomRight = BoardPosition(x: 5, y: 5)
        let overLeft = BoardPosition(x: -1, y: 0)
        let overTop = BoardPosition(x: 0, y: -1)
        let overRight = BoardPosition(x: 6, y: 0)
        let overBottom = BoardPosition(x: 0, y: 6)
        XCTAssertTrue(sut.contains(topLeft))
        XCTAssertTrue(sut.contains(bottomRight))
        XCTAssertFalse(sut.contains(overLeft))
        XCTAssertFalse(sut.contains(overTop))
        XCTAssertFalse(sut.contains(overRight))
        XCTAssertFalse(sut.contains(overBottom))
    }
    
    private func prepareSut(count: Int) {
        self.sut = StubBoardSetupBuilder().set(height: count, width: count).build()
    }
}
