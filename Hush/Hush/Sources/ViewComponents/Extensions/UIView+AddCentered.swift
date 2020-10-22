//
//  UIView+AddCentered.swift
//  Hush
//
//  Created by Tomasz Kryg on 22/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

extension UIView {
    func addCentered(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        view.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        view.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: leadingAnchor, multiplier: 1.0).isActive = true
        view.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: trailingAnchor, multiplier: 1.0).isActive = true
        view.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: topAnchor, multiplier: 1.0).isActive = true
        view.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: bottomAnchor, multiplier: 1.0).isActive = true
    }
}
