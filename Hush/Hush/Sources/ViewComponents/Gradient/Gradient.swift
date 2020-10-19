//
//  Gradient.swift
//  Hush
//
//  Created by Tomasz Kryg on 19/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

struct Gradient {
    var colors: [UIColor]
    var locations: [NSNumber]
    var type: CAGradientLayerType
    var startPoint: CGPoint
    var endPoint: CGPoint
    
    init(colors: [UIColor],
         locations: [NSNumber] = [0.0, 1.0],
         type: CAGradientLayerType = .axial,
         startPoint: CGPoint = .init(x: 0.0, y: 0.0),
         endPoint: CGPoint = .init(x: 1.0, y: 1.0)) {
        self.colors = colors
        self.locations = locations
        self.type = type
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
}
