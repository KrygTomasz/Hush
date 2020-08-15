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
    
    private func prepareSut(count: Int) {
        self.sut = StubBoardSetupBuilder().set(height: count, width: count).build()
    }
}
