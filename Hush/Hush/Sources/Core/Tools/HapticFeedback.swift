//
//  HapticFeedback.swift
//  Hush
//
//  Created by Tomasz Kryg on 17/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class HapticFeedback {
    static func launch() {
        let notification = UIImpactFeedbackGenerator()
        notification.impactOccurred()
    }
}
