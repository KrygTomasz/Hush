//
//  MenuViewModel.swift
//  Hush
//
//  Created by Tomasz Kryg on 12/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import Foundation

final class MenuViewModel {
    
    struct Input {
        
    }
    
    struct Output {
        let viewData: [MenuViewData]
    }
    
    var output: Output!
    
    init() {
        
    }
    
    func transform(input: Input) {
        output = Output(viewData: [
            MenuViewData(title: "1st button"),
            MenuViewData(title: "2nd button"),
            MenuViewData(title: "3rd button")
        ])
    }
}
