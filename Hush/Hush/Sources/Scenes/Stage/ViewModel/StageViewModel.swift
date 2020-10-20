//
//  StageViewModel.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

final class StageViewModel {
    struct Output {
        let color: Color
    }
    
    var output: Output! = .init(color: .random)
}
