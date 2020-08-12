//
//  PulsatoryView.swift
//  Hush
//
//  Created by Tomasz Kryg on 11/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class PulsatoryView: UIView {
    
    private lazy var circle: Circle = {
        let view = Circle(autoLayout: true)
        view.backgroundColor = UIColor.systemGreen
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(autoLayout: true)
        label.text = "Sample text"
        label.textColor = UIColor.white
        return label
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        backgroundColor = UIColor.white
        addSubview(circle)
        addSubview(titleLabel)
        setupConstraints()
        startPulseAnimation()
    }
    
    private func setupConstraints() {
        circle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Margin.wide).isActive = true
        circle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Margin.wide).isActive = true
        circle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        circle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        titleLabel.centerYAnchor.constraint(equalTo: circle.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: circle.centerXAnchor).isActive = true
    }
    
    private func startPulseAnimation() {
        let transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        circle.transform = transform
        titleLabel.transform = transform
        
        UIView.animate(withDuration: 5.0, delay: 0.0, options: [.autoreverse, .repeat], animations: { [weak self] in
            self?.circle.transform = CGAffineTransform.identity
            self?.titleLabel.transform = CGAffineTransform.identity
        }, completion: { _ in return })
    }
    
}
