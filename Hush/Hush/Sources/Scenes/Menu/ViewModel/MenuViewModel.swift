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
        let color: Color
        let viewData: [MenuViewData]
        func viewData(for indexPath: IndexPath) -> MenuViewData? {
            return viewData[safe: indexPath.item]
        }
    }
    
    var output: Output!
    private var route: (MenuChannel) -> Void
    
    init(route: @escaping (MenuChannel) -> Void) {
        self.route = route
    }
    
    func transform(input: Input) {
        let color = Color.random
        output = Output(color: color,
                        viewData: [
                            MenuViewData(imageName: "play", color: color, action: { [weak self] in self?.route(.stages) }),
                            MenuViewData(imageName: "settings", color: color, action: {  })
        ])
    }
}
