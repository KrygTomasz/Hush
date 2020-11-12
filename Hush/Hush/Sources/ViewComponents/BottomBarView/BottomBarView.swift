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
    
    private lazy var containerView: UIView = {
        let view = UIView(autoLayout: true)
        return view
    }()
    
    private lazy var bottomBar: UIStackView = {
        let view = UIStackView(autoLayout: true)
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    lazy var firstButton: UIButton = {
        return createButton()
    }()
    
    lazy var secondButton: UIButton = {
        return createButton()
    }()
    
    lazy var thirdButton: UIButton = {
        return createButton()
    }()
    
    lazy var fourthButton: UIButton = {
        return createButton()
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
    
    func set(color: Color) {
        firstButton.tintColor = color.secondary
        secondButton.tintColor = color.secondary
        thirdButton.tintColor = color.secondary
        fourthButton.tintColor = color.secondary
        containerView.backgroundColor = color.primary
    }
    
    func addTopShadow() {
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = .init(width: 0, height: -9)
        containerView.layer.shadowRadius = 5
    }
    
    // MARK: - Helper setup
    
    private func commonSetup() {
        backgroundColor = .clear
        addSubview(containerView)
        constraintContainerView()
        containerView.addSubview(bottomBar)
        constraintBottomBar()
        prepareBottomBarButtons()
    }
    
    private func constraintContainerView() {
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.wide).isActive = true
    }
    
    private func constraintBottomBar() {
        bottomBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bottomBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.wide).isActive = true
    }
    
    private func prepareBottomBarButtons() {
        bottomBar.addArrangedSubview(firstButton)
        bottomBar.addArrangedSubview(secondButton)
        bottomBar.addArrangedSubview(thirdButton)
        bottomBar.addArrangedSubview(fourthButton)
        firstButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true
        secondButton.heightAnchor.constraint(equalTo: firstButton.heightAnchor).isActive = true
        thirdButton.heightAnchor.constraint(equalTo: firstButton.heightAnchor).isActive = true
        fourthButton.heightAnchor.constraint(equalTo: firstButton.heightAnchor).isActive = true
    }
    
    private func tryToAdd(view: UIView?, into parentView: UIView) {
        guard let view = view else { return }
        parentView.addCentered(view: view)
    }
    
    private func createButton() -> UIButton {
        let button = UIButton(autoLayout: true)
        button.backgroundColor = .clear
        button.setTitle("", for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addScaledTap()
        return button
    }
    
    private enum Constants {
        static let buttonHeight: CGFloat = 80
        static let imageSize: CGFloat = 64
    }
    
}
