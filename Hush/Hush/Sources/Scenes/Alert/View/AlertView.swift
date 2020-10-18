//
//  AlertView.swift
//  Hush
//
//  Created by Tomasz Kryg on 15/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class AlertView: UIView {
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(autoLayout: true)
        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = .small
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(autoLayout: true)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel(autoLayout: true)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var firstButton: UIButton = {
        let button = UIButton(autoLayout: true)
        button.layer.cornerRadius = .wide
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonSetup()
    }
    
    private func commonSetup() {
        backgroundColor = .clear
        addSubview(stackView)
        
        layer.cornerRadius = Margin.wide
        backgroundColor = .red
        
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .wide).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: .wide).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.wide).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.wide).isActive = true
    }
    
    func configure(with alert: Alert) {
        let subviews = stackView.arrangedSubviews
        subviews.forEach(stackView.removeArrangedSubview)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        titleLabel.text = alert.title
        descriptionLabel.text = alert.description
    }
}
