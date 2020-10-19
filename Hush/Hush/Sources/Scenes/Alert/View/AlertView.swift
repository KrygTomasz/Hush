//
//  AlertView.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

typealias DismissCompletion = (() -> Void)

class AlertView: GradientView {
    
    private var dismissHandler: ((_ completion: DismissCompletion?) -> Void)?
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(autoLayout: true)
        view.distribution = .fill
        view.axis = .vertical
        view.spacing = .medium
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        return defaultLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
        return defaultLabel
    }()
    
    lazy var firstButton: UIButton = {
        return defaultButton
    }()
    
    lazy var secondButton: UIButton = {
        return defaultButton
    }()
    
    private var defaultLabel: UILabel {
        let label = UILabel(autoLayout: true)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    
    private var defaultButton: UIButton {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = .wide
        button.heightAnchor.constraint(equalToConstant: .wide*2).isActive = true
        button.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        button.addScaledTap()
        return button
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonSetup()
    }
    
    private var buttonActions: [Int: AlertButtonAction] = [:]
    
    private func commonSetup() {
        layer.cornerRadius = Margin.wide
        addSubview(stackView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .wide).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: .wide).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.wide).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.wide).isActive = true
    }
    
    func configure(with alert: Alert, dismissHandler: ((_ completion: DismissCompletion?) -> Void)?) {
        self.dismissHandler = dismissHandler
        stackView.arrangedSubviews.forEach(stackView.removeArrangedSubview)
        if alert.title.exists {
            stackView.addArrangedSubview(titleLabel)
            titleLabel.text = alert.title
            titleLabel.textColor = alert.color.secondary
        }
        if alert.description.exists {
            stackView.addArrangedSubview(descriptionLabel)
            descriptionLabel.text = alert.description
            descriptionLabel.textColor = alert.color.secondary
        }
        if let firstButtonData = alert.firstButtonData {
            add(button: firstButton, with: firstButtonData)
            set(color: alert.color, for: firstButton)
        }
        if let secondButtonData = alert.secondButtonData {
            add(button: secondButton, with: secondButtonData)
            set(color: alert.color, for: secondButton)
        }
        set(gradient: .init(colors: [alert.color.tertiary, alert.color.primary]))
    }
        
    private func add(button: UIButton, with data: AlertButtonData) {
        stackView.addArrangedSubview(button)
        button.setTitle(data.text, for: .normal)
        buttonActions[button.hash] = data.action
    }
    
    private func set(color: Color, for button: UIButton) {
        button.setTitleColor(color.tertiary, for: .normal)
        button.backgroundColor = color.secondary
    }
    
    @objc func onButtonTapped(_ button: UIButton) {
        dismissHandler?(buttonActions[button.hash])
    }
}
