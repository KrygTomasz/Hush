//
//  UIView+Tap.swift
//  Hush
//
//  Created by Tomasz Kryg on 11/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

extension UIView {
    
    private enum Constants {
        static let duration: Double = 0.3
        static let scale: CGFloat = 1.1
    }
    
    func addScaledTap(onSuccess: (() -> Void)? = nil,
                      onCancel: (() -> Void)? = nil) {
        let gesture = LongPressGestureRecognizer(target: self, action: #selector(onTap))
        gesture.onSuccess = onSuccess
        gesture.onCancel = onCancel
        gesture.minimumPressDuration = 0
        addGestureRecognizer(gesture)
    }
    
    @objc private func onTap(_ recognizer: LongPressGestureRecognizer) {
        switch recognizer.state {
        case .began:
            focused()
        case .ended:
            recognizer.onSuccess?()
            unfocused()
        case .changed:
            let topLocation = recognizer.location(in: self)
            if !point(inside: topLocation, with: nil) {
                recognizer.state = .cancelled
            }
        case .cancelled:
            recognizer.onCancel?()
            unfocused()
        default: return
        }
    }
    
    private func focused() {
        UIView.animate(withDuration: Constants.duration) {
            self.transform = self.transform.scaledBy(x: Constants.scale, y: Constants.scale)
        }
    }
    
    private func unfocused() {
        UIView.animate(withDuration: Constants.duration) {
            self.transform = .identity
        }
    }
    
}
