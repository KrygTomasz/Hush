//
//  FontSize.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

enum FontSize {
    case small
    case medium
    case large
    
    var size: CGFloat {
        switch self {
        case .small:
            return 18.0
        case .medium:
            return 28.0
        case .large:
            return 56.0
        }
    }
}
