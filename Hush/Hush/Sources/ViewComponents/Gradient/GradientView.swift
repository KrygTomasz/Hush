//
//  GradientView.swift
//  Hush
//
//  Created by Tomasz Kryg on 19/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class GradientView: UIView {
    private var colors: [UIColor] = []
    
    override class var layerClass: AnyClass { CAGradientLayer.self }
    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
    
    func set(gradient: Gradient) {
        self.colors = gradient.colors
        gradientLayer.colors = gradient.colors.map { $0.cgColor }
        gradientLayer.locations = gradient.locations
        gradientLayer.type = gradient.type
        gradientLayer.startPoint = gradient.startPoint
        gradientLayer.endPoint = gradient.endPoint
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        gradientLayer.colors = colors.map { $0.cgColor }
    }
}
