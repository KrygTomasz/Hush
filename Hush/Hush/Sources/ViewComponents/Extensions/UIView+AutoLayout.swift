//
//  UIView+AutoLayout.swift
//  Hush
//
//  Created by Tomasz Kryg on 12/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

extension UIView {
    public convenience init(autoLayout: Bool) {
        self.init(frame: .zero)
        if autoLayout { translatesAutoresizingMaskIntoConstraints = false }
    }
}
