//
//  LightStateReducerTests.swift
//  HushTests
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import XCTest
@testable import Hush

final class LightStateReducer: XCTestCase {
    func test_reduceOffState_returnsOnState() {
        let state = Hush.LightStateReducer.reduce(state: .off)
        XCTAssertEqual(state, .on)
    }
    
    func test_reduceOnState_returnsOffState() {
        let state = Hush.LightStateReducer.reduce(state: .on)
        XCTAssertEqual(state, .off)
    }
}
