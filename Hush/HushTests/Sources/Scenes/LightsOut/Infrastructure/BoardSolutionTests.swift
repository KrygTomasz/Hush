//
//  BoardSolutionTests.swift
//  HushTests
//
//  Created by Tomasz Kryg on 17/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import XCTest
@testable import Hush

final class BoardSolutionTests: XCTestCase {
    var sut: BoardSolution!
    
    override func setUp() {
        sut = BoardSolution()
    }
    
    func test_emptySolution_containsNoHints() {
        XCTAssertEqual(sut.getHint(), nil)
    }
    
    func test_nonEmptySolution_containsHintAtLastPosition() {
        let firstPosition = BoardPosition(x: 0, y: 0)
        let secondPosition = BoardPosition(x: 2, y: 1)
        sut.update(position: firstPosition)
        sut.update(position: secondPosition)
        XCTAssertEqual(sut.getHint(), secondPosition)
    }
    
    func test_nonEmptySolution_updatedAccordingToHint_hintChanges() {
        let firstPosition = BoardPosition(x: 0, y: 0)
        let secondPosition = BoardPosition(x: 2, y: 1)
        let thirdPosition = BoardPosition(x: 3, y: 4)
        sut.update(position: firstPosition)
        sut.update(position: secondPosition)
        sut.update(position: thirdPosition)
        XCTAssertEqual(sut.getHint(), thirdPosition)
        sut.update(position: thirdPosition)
        XCTAssertEqual(sut.getHint(), secondPosition)
        sut.update(position: firstPosition)
        XCTAssertEqual(sut.getHint(), secondPosition)
        sut.update(position: secondPosition)
        XCTAssertEqual(sut.getHint(), nil)
    }
}
