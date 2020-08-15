//
//  MarginTests.swift
//  HushTests
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import XCTest
@testable import Hush

final class MarginTests: XCTestCase {
    func test_wideMargin_returnsProperValue() {
        XCTAssertEqual(Margin.wide, 24.0)
    }
    
    func test_mediumMargin_returnsProperValue() {
        XCTAssertEqual(Margin.medium, 16.0)
    }
    
    func test_smallMargin_returnsProperValue() {
        XCTAssertEqual(Margin.small, 8.0)
    }
}
