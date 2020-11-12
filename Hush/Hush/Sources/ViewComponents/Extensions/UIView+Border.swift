//
//  UIView+Border.swift
//  Hush
//
//  Created by Tomasz Kryg on 12/11/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

extension UIView {
    func addBorder(color: UIColor) {
        layer.borderWidth = 1.0
        layer.borderColor = color.cgColor
    }
}
