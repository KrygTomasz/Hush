//
//  String+ExistsTests.swift
//  HushTests
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import XCTest
@testable import Hush

final class String_ExistsTests: XCTestCase {
    func test_noneString_notExists() {
        let string: String? = nil
        XCTAssertFalse(string.exists)
    }
    
    func test_emptyString_notExists() {
        let string: String? = ""
        XCTAssertFalse(string.exists)
    }
    
    func test_notEmptyString_exists() {
        let string: String? = " "
        XCTAssertTrue(string.exists)
    }
}
