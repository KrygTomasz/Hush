//
//  UIColor+Dynamic.swift
//  Hush
//
//  Created by Tomasz Kryg on 19/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

extension UIColor {
    func asDynamic(onDark darkColor: UIColor) -> UIColor {
        return .init(dynamicProvider: { [weak self] (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                return darkColor
            } else {
                return self ?? darkColor
            }
        })
    }
}
