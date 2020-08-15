//
//  BoardSetupFactoryTests.swift
//  HushTests
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import XCTest
@testable import Hush

final class BoardSetupFactoryTests: XCTestCase {
    var setup: BoardSetup!
    
    func test_createSquaredSize_shouldReturnSquareWithEmptyFields() {
        let height: Int = 3
        let width: Int = 3
        
        let size = BoardSize(height: height, width: width)
        self.setup = BoardSetupFactory.create(size: size)
        assertBoardSetupEmpty(height: height, width: width)
    }
    
    func test_createRectangledSize_shouldReturnRectangleWithEmptyFields() {
        let height: Int = 10
        let width: Int = 7
        
        let size = BoardSize(height: height, width: width)
        self.setup = BoardSetupFactory.create(size: size)
        assertBoardSetupEmpty(height: height, width: width)
    }
    
    private func assertBoardSetupEmpty(height: Int, width: Int) {
        (0..<height).forEach { y in
            (0..<width).forEach { x in
                XCTAssertEqual(setup.getState(x: x, y: y), .off)
            }
        }
    }
}
