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
    
    // MARK: - Toggle
    
    func test_emptySetup_middleFieldClicked_fieldsAroundItShouldBeAlsoToggled() {
        assertBoardSetupEmpty()
        let position = BoardPosition(x: 1, y: 1)
        sut.toggle(position: position, setup: setup)
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
    
    func test_emptySetup_edgeFieldClicked_fieldsAroundItShouldBeAlsoToggled() {
        assertBoardSetupEmpty()
        let position = BoardPosition(x: 0, y: 0)
        sut.toggle(position: position, setup: setup)
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
    
    func test_emptySetup_anyFieldClickedTwice_setupShouldBeEmpty() {
        assertBoardSetupEmpty()
        let position = BoardPosition(x: 2, y: 3)
        sut.toggle(position: position, setup: setup)
        (0..<height).forEach { y in
            (0..<width).forEach { x in
                let state = setup.getState(x: x, y: y)
                switch (x,y) {
                case (2,3), (1,3), (3,3), (2,2), (2,4): XCTAssertEqual(state, .on, prepareFailMessage(x: x, y: y, state: .on))
                default: XCTAssertEqual(state, .off, prepareFailMessage(x: x, y: y, state: .off))
                }
            }
        }
        sut.toggle(position: position, setup: setup)
        assertBoardSetupEmpty()
    }
    
    func test_emptySetup_twoNeighbourFieldsClicked_severalFieldsShouldBeEmptyAgain() {
        assertBoardSetupEmpty()
        let firstPosition = BoardPosition(x: 3, y: 3)
        sut.toggle(position: firstPosition, setup: setup)
        (0..<height).forEach { y in
            (0..<width).forEach { x in
                let state = setup.getState(x: x, y: y)
                switch (x,y) {
                case (3,3), (2,3), (4,3), (3,2), (3,4): XCTAssertEqual(state, .on, prepareFailMessage(x: x, y: y, state: .on))
                default: XCTAssertEqual(state, .off, prepareFailMessage(x: x, y: y, state: .off))
                }
            }
        }
        let secondPosition = BoardPosition(x: 2, y: 3)
        sut.toggle(position: secondPosition, setup: setup)
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
    
    // MARK: - Hint
    
    func test_emptySetup_noHint() {
        assertBoardSetupEmpty()
        let hintPosition = sut.hint(for: setup)
        XCTAssertEqual(hintPosition, nil)
    }
    
    func test_emptySetup_fieldClicked_hintShowsThatField() {
        assertBoardSetupEmpty()
        let clickedPosition = BoardPosition(x: 1, y: 1)
        sut.toggle(position: clickedPosition, setup: setup)
        let hintPosition = sut.hint(for: setup)
        XCTAssertEqual(hintPosition, clickedPosition)
    }
    
    func test_emptySetup_fieldClickedTwice_noHint() {
        assertBoardSetupEmpty()
        let clickedPosition = BoardPosition(x: 2, y: 2)
        sut.toggle(position: clickedPosition, setup: setup)
        sut.toggle(position: clickedPosition, setup: setup)
        let hintPosition = sut.hint(for: setup)
        XCTAssertEqual(hintPosition, nil)
    }
    
    func test_emptySetup_severalDifferentFieldsClicked_hintShowsThoseFieldsInOrder() {
        var hintPosition: BoardPosition?
        assertBoardSetupEmpty()
        XCTAssertEqual(hintPosition, nil)
        let firstClickedPosition = BoardPosition(x: 3, y: 1)
        let secondClickedPosition = BoardPosition(x: 0, y: 2)
        sut.toggle(position: firstClickedPosition, setup: setup)
        sut.toggle(position: secondClickedPosition, setup: setup)
        hintPosition = sut.hint(for: setup)
        XCTAssertEqual(hintPosition, secondClickedPosition)
        sut.toggle(position: secondClickedPosition, setup: setup)
        hintPosition = sut.hint(for: setup)
        XCTAssertEqual(hintPosition, firstClickedPosition)
        sut.toggle(position: firstClickedPosition, setup: setup)
        hintPosition = sut.hint(for: setup)
        XCTAssertEqual(hintPosition, nil)
    }
    
    // MARK: - Helpers
    
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
