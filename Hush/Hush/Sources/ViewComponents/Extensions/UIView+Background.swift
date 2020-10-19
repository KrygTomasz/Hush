//
//  UIView+Background.swift
//  Hush
//
//  Created by Tomasz Kryg on 19/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

extension UIView {
    private func addBackgroundView<T: UIView>() -> T {
        let view = T()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        sendSubviewToBack(view)
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        return view
    }
    
    func addGradientBackground(with gradient: Gradient) {
        let gradientView: GradientView = addBackgroundView()
        gradientView.set(gradient: gradient)
    }
}
