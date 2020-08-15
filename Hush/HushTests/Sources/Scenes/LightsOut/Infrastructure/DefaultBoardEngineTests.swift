//
//  DefaultBoardEngineTests.swift
//  HushTests
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import XCTest

@testable import Hush

final class DefaultBoardEngineTests: XCTestCase {
    var setup: BoardSetup!
    var sut: DefaultBoardEngine!
    let height: Int = 5
    let width: Int = 5
    
    override func setUp() {
        prepareSut()
    }
    
    func test_emptyBoardSetup_middleFieldClicked_fieldsAroundItShouldBeAlsoToggled() {
        assertBoardSetupEmpty()
        sut.toggle(x: 1, y: 1, setup: setup)
        (0..<height).forEach { y in
            (0..<width).forEach { x in
                let state = setup.getState(x: x, y: y)
                switch (x,y) {
                case (0,1), (1,0), (1,1), (1,2), (2,1): XCTAssertEqual(state, .on, prepareFailMessage(x: x, y: y, state: .on))
                default: XCTAssertEqual(state, .off, prepareFailMessage(x: x, y: y, state: .off))
                }
            }
        }
    }
    
    func test_emptyBoardSetup_edgeFieldClicked_fieldsAroundItShouldBeAlsoToggled() {
        assertBoardSetupEmpty()
        sut.toggle(x: 0, y: 0, setup: setup)
        (0..<height).forEach { y in
            (0..<width).forEach { x in
                let state = setup.getState(x: x, y: y)
                switch (x,y) {
                case (0,0), (1,0), (0,1): XCTAssertEqual(state, .on, prepareFailMessage(x: x, y: y, state: .on))
                default: XCTAssertEqual(state, .off, prepareFailMessage(x: x, y: y, state: .off))
                }
            }
        }
    }
    
    func test_emptyBoardSetup_anyFieldClickedTwice_setupShouldBeEmpty() {
        assertBoardSetupEmpty()
        sut.toggle(x: 2, y: 3, setup: setup)
        (0..<height).forEach { y in
            (0..<width).forEach { x in
                let state = setup.getState(x: x, y: y)
                switch (x,y) {
                case (2,3), (1,3), (3,3), (2,2), (2,4): XCTAssertEqual(state, .on, prepareFailMessage(x: x, y: y, state: .on))
                default: XCTAssertEqual(state, .off, prepareFailMessage(x: x, y: y, state: .off))
                }
            }
        }
        sut.toggle(x: 2, y: 3, setup: setup)
        assertBoardSetupEmpty()
    }
    
    func test_emptyBoardSetup_twoNeighbourFieldsClicked_severalFieldsShouldBeEmptyAgain() {
        assertBoardSetupEmpty()
        sut.toggle(x: 3, y: 3, setup: setup)
        (0..<height).forEach { y in
            (0..<width).forEach { x in
                let state = setup.getState(x: x, y: y)
                switch (x,y) {
                case (3,3), (2,3), (4,3), (3,2), (3,4): XCTAssertEqual(state, .on, prepareFailMessage(x: x, y: y, state: .on))
                default: XCTAssertEqual(state, .off, prepareFailMessage(x: x, y: y, state: .off))
                }
            }
        }
        sut.toggle(x: 2, y: 3, setup: setup)
        (0..<height).forEach { y in
            (0..<width).forEach { x in
                let state = setup.getState(x: x, y: y)
                switch (x,y) {
                case (3,2), (3,4), (4,3), (2,2), (2,4), (1,3): XCTAssertEqual(state, .on, prepareFailMessage(x: x, y: y, state: .on))
                default: XCTAssertEqual(state, .off, prepareFailMessage(x: x, y: y, state: .off))
                }
            }
        }
    }
    
    private func prepareFailMessage(x: Int, y: Int, state: LightState) -> String {
        switch state {
        case .on: return "Field \(x),\(y) shouldn't be on."
        case .off: return "Field \(x),\(y) shouldn't be off."
        }
    }
    
    private func prepareSut() {
        self.setup = StubBoardSetupBuilder()
            .set(height: height, width: width)
            .set { _ in return .off }
            .build()
        sut = DefaultBoardEngine()
    }
    
    private func assertBoardSetupEmpty() {
        (0..<height).forEach { y in
            (0..<width).forEach { x in
                XCTAssertEqual(setup.getState(x: x, y: y), .off)
            }
        }
    }
}
