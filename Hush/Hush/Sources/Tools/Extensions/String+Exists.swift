//
//  String+Exists.swift
//  Hush
//
//  Created by Tomasz Kryg on 18/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    var exists: Bool {
        return self?.exists ?? false
    }
}

extension String {
    var exists: Bool {
        return !isEmpty
    }
}
