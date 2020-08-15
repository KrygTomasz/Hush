//
//  BoardRow.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

struct BoardRow {
    var items: [BoardItem]
    
    ///Debug  purposes only
    func log() {
        var rowLog = ""
        items.forEach {
            switch $0.state {
            case .on: rowLog.append("x")
            case .off: rowLog.append("o")
            }
        }
        print(rowLog)
    }
}
