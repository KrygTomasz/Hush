//
//  UIView+Margin.swift
//  Hush
//
//  Created by Tomasz Kryg on 17/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

extension UIView {
    func setMargin(_ margin: Margin) {
        directionalLayoutMargins = .init(top: margin, leading: margin, bottom: margin, trailing: margin)
        preservesSuperviewLayoutMargins = false
    }
    
    func setSmallMargins() {
        setMargin(.small)
    }
    
    func setMediumMargins() {
        setMargin(.medium)
    }
    
    func setWideMargins() {
        setMargin(.wide)
    }
}
