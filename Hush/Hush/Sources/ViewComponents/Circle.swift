//
//  Circle.swift
//  Hush
//
//  Created by Tomasz Kryg on 11/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit
import CoreGraphics

class Circle: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = self.frame.size.width / 2
        addGradient(color: UIColor.white)
        super.layoutSubviews()
    }
    
    func addGradient(color: UIColor) {
        guard let backgroundColor = self.backgroundColor else { return }
        let maskLayer = CAGradientLayer()
        maskLayer.frame = self.bounds
        maskLayer.type = .radial
        maskLayer.colors = [backgroundColor.cgColor, color.cgColor]
        maskLayer.locations = [0.7, 1.0]
        maskLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        maskLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        maskLayer.cornerRadius = self.frame.size.width / 2
        layer.addSublayer(maskLayer)
    }
}
