//
//  LongPressGestureRecognizer.swift
//  Hush
//
//  Created by Tomasz Kryg on 11/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class LongPressGestureRecognizer: UILongPressGestureRecognizer {
    var onSuccess: (() -> Void)?
    var onCancel: (() -> Void)?
    
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }
}
