//
//  BottomBarView.swift
//  Hush
//
//  Created by Tomasz Kryg on 22/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class BottomBarView: UIView {
    
    // MARK: - Subviews
    
    private lazy var bottomBar: UIStackView = {
        let view = UIStackView(autoLayout: true)
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var firstView: UIView = {
        return UIView()
    }()
    
    private lazy var secondView: UIView = {
        return UIView()
    }()
    
    private lazy var thirdView: UIView = {
        return UIView()
    }()
    
    private lazy var fourthView: UIView = {
        return UIView()
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonSetup()
    }
    
    // MARK: - Public configuration
    
    func setButtons(first: UIView? = nil,
                    second: UIView? = nil,
                    third: UIView? = nil,
                    fourth: UIView? = nil) {
        clear()
        tryToAdd(view: first, into: firstView)
        tryToAdd(view: second, into: secondView)
        tryToAdd(view: third, into: thirdView)
        tryToAdd(view: fourth, into: fourthView)
    }
    
    // MARK: - Helper setup
    
    private func commonSetup() {
        backgroundColor = .clear
        addSubview(bottomBar)
        prepareBottomBar()
        bottomBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bottomBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.wide).isActive = true
    }
    
    private func prepareBottomBar() {
        bottomBar.addArrangedSubview(firstView)
        bottomBar.addArrangedSubview(secondView)
        bottomBar.addArrangedSubview(thirdView)
        bottomBar.addArrangedSubview(fourthView)
    }
    
    private func clear() {
        firstView.subviews.forEach { $0.removeFromSuperview() }
        secondView.subviews.forEach { $0.removeFromSuperview() }
        thirdView.subviews.forEach { $0.removeFromSuperview() }
        fourthView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    private func tryToAdd(view: UIView?, into parentView: UIView) {
        guard let view = view else { return }
        parentView.addCentered(view: view)
    }
    
}
