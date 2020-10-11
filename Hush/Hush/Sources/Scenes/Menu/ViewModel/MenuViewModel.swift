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
        func viewData(for indexPath: IndexPath) -> MenuViewData? {
            return viewData[safe: indexPath.item]
        }
    }
    
    var output: Output!
    var route: (MenuChannel) -> Void
    
    init(route: @escaping (MenuChannel) -> Void) {
        self.route = route
    }
    
    func transform(input: Input) {
        output = Output(viewData: [
            MenuViewData(title: "1st button", action: { [weak self] in self?.route(.board) }),
            MenuViewData(title: "2nd button", action: { [weak self] in self?.route(.board) }),
            MenuViewData(title: "3rd button", action: { [weak self] in self?.route(.board) })
        ])
    }
}
