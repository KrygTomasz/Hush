//
//  UILabel+Styles.swift
//  Hush
//
//  Created by Tomasz Kryg on 20/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

extension UILabel {
    func bold(_ size: FontSize) {
        font = UIFont.boldSystemFont(ofSize: size.size)
    }
}
